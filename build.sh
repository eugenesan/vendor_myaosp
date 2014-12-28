#!/bin/bash

#
# Android AOSP/MyAOSP/AOSPA/CM/SLIM/MAHDI/EOS build script
# Version 2.0.13
#
# https://source.android.com/source/initializing.html
#
# Requirements (Ubuntu-14.04): bison g++-multilib git gperf libxml2-utils openjdk-7-jdk

# Clean scrollback buffer
echo -e '\0033\0143'
clear

# Get current path
DIR="$(cd `dirname $0`; pwd)"
OUT="$(readlink $DIR/out)"
[ -z "${OUT}" ] && OUT="${DIR}/out"

# Prepare output customization commands
red=$(tput setaf 1)             # red
grn=$(tput setaf 2)             # green
blu=$(tput setaf 4)             # blue
cya=$(tput setaf 6)             # cyan
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldblu=${txtbld}$(tput setaf 4) # blue
bldcya=${txtbld}$(tput setaf 6) # cyan
txtbld=$(tput bold)             # bold
txtrst=$(tput sgr0)             # reset

# Local defaults, can be overriden by environment
: ${PREFS_FROM_SOURCE:="false"}
: ${WITHOUT_PROP_APPS:="true"}
: ${WITHOUT_MC:="true"}
: ${USE_CCACHE:="true"}
: ${CCACHE_NOSTATS:="false"}
: ${CCACHE_DIR:="$(dirname $OUT)/ccache"}
: ${THREADS:="$(cat /proc/cpuinfo | grep "^processor" | wc -l)"}
#: ${STOCK_SYSTEM_IMAGE:="$(dirname $OUT)/../system.img"}
: ${ODEX_MODE:="true"}

# If there is more than one jdk installed, use latest 7.x
if [ "`update-alternatives --list javac | wc -l`" -gt 1 ]; then
        JDK=$(dirname `update-alternatives --list javac | grep "\-7\-"` | tail -n1)
        JRE=$(dirname ${JDK}/../jre/bin/java)
        export JAVA_HOME=$(dirname ${JRE}/..)
        export J2SDKDIR=${JAVA_HOME}
        export J2REDIR=${JAVA_HOME}/jre
        export PATH=${JDK}:${JRE}:$PATH

        #echo -e "${bldblu}Overriding default JRE/JDK:[${JRE}][${JDK}][${JAVA_HOME}], PATH:[${PATH}]${txtrst}"
#else
        #echo -e "${bldblu}Using default JRE/JDK with compression enabled PATH:[${PATH}]${txtrst}"
fi
JVER=$(javac -version  2>&1 | head -n1 | cut -f2 -d' ')

# Import command line parameters
DEVICE="$1"
EXTRAS="$2"

# Set default device
: ${DEVICE:="hammerhead"}

# Get build version
if [ -r "${DIR}/vendor/pa/vendor.mk" ]; then
        VENDOR="aospa"
        VENDOR_LUNCH="pa_"
        VENDOR_MK="${DIR}/vendor/pa/vendor.mk"
elif [ -r "${DIR}/vendor/slim/config/common.mk" ]; then
        VENDOR="slim"
        VENDOR_LUNCH="slim_"
        VENDOR_MK="${DIR}/vendor/slim/config/common.mk"
elif [ -r "${DIR}/vendor/cm/config/common.mk" ]; then
        VENDOR="cm"
        VENDOR_LUNCH=""
        VENDOR_MK="${DIR}/vendor/cm/config/common.mk"
        VENDOR_PB_XML_URL="https://gist.github.com/eugenesan/857b32fb134cbe26fe99/raw/proprietary_vendor_lge.xml"
        VENDOR_PB_XML=".repo/local_manifests"
elif [ -r "${DIR}/vendor/mahdi/config/common_versions.mk" ]; then
        VENDOR="mahdi"
        VENDOR_LUNCH=""
        VENDOR_MK="${DIR}/vendor/mahdi/config/common_versions.mk"
elif [ -r "${DIR}/vendor/eos/config/common_versions.mk" ]; then
        VENDOR="eos"
        VENDOR_LUNCH=""
        VENDOR_MK="${DIR}/vendor/eos/config/common_versions.mk"
elif [ -r "${DIR}/vendor/myaosp/product/common.mk" ]; then
        VENDOR="myaosp"
        VENDOR_LUNCH=""
        VENDOR_MK="${DIR}/build/core/version_defaults.mk"
elif [ -r "${DIR}/build/core/version_defaults.mk" ]; then
        VENDOR="aosp"
        VENDOR_LUNCH="full_"
        VENDOR_MK="${DIR}/build/core/version_defaults.mk"
else
        echo -e "${redbld}Invalid android tree, exiting...${txtrst}"
        exit 1
fi

if [ "${VENDOR}" == "aosp" ] || [ "${VENDOR}" == "myaosp" ]; then
        MAJOR=$(cat ${VENDOR_MK} | grep 'PLATFORM_VERSION := *' | awk '{print $3}' | cut -f2 -d= | cut -f1 -d.)
        MINOR=$(cat ${VENDOR_MK} | grep 'PLATFORM_VERSION := *' | awk '{print $3}' | cut -f2 -d= | cut -f2 -d.)
        MAINT=$(cat ${VENDOR_MK} | grep 'PLATFORM_VERSION := *' | awk '{print $3}' | cut -f2 -d= | cut -f3 -d.)
elif [ "${VENDOR}" == "aospa" ]; then
        MAJOR=$(cat ${VENDOR_MK} | grep 'ROM_VERSION_MAJOR = *' | grep -v "^#" | sed  's/ROM_VERSION_MAJOR = //g')
        MINOR=$(cat ${VENDOR_MK} | grep 'ROM_VERSION_MINOR = *' | grep -v "^#" | sed  's/ROM_VERSION_MINOR = //g')
        MAINT=$(cat ${VENDOR_MK} | grep 'ROM_VERSION_MAINTENANCE = *' | grep -v "^#" | sed  's/ROM_VERSION_MAINTENANCE = //g')
else
        MAJOR=$(cat ${VENDOR_MK} | grep 'PRODUCT_VERSION_MAJOR = *' | grep -v "^#" | sed  's/PRODUCT_VERSION_MAJOR = //g')
        MINOR=$(cat ${VENDOR_MK} | grep 'PRODUCT_VERSION_MINOR = *' | grep -v "^#" | sed  's/PRODUCT_VERSION_MINOR = //g')
        MAINT=$(cat ${VENDOR_MK} | grep 'PRODUCT_VERSION_MAINTENANCE = *' | grep -v "^#" | sed  's/PRODUCT_VERSION_MAINTENANCE = //g')
fi

VERSION=$VENDOR-$MAJOR.$MINOR$([ -n "$MAINT" ] && echo .)$MAINT

# If there is no extra parameter, reduce parameters index by 1
if [ "$EXTRAS" == "true" ] || [ "$EXTRAS" == "false" ]; then
        SYNC="$2"
        UPLOAD="$3"
else
        SYNC="$3"
        UPLOAD="$4"
fi

# Get start time
res1=$(date +%s.%N)

# Prepare ccache and get it's initial size for reference
if [ "${USE_CCACHE}" == "true" ]; then
        # Prefer system ccache with compression
        CCACHE="$(which ccache)"
        if [ -n "${CCACHE}" ]; then
                export CCACHE_COMPRESS="1"
                export USE_SYSTEM_CCACHE="1"
                echo -e "${bldblu}Using system ccache with compression enabled [${CCACHE}]${txtrst}"
        elif [ -r "${DIR}/prebuilts/misc/linux-x86/ccache/ccache" ]; then
                CCACHE="${DIR}/prebuilts/misc/linux-x86/ccache/ccache"
                echo -e "${bldblu}Using prebuilt ccache [${CCACHE}]${txtrst}"
                unset USE_SYSTEM_CCACHE
        else
                echo -e "${bldblu}No suitable ccache found, disabling ccache usage${txtrst}"
                unset USE_CCACHE
                unset CCACHE_DIR
                unset CCACHE_NOSTATS
                unset CCACHE
        fi

        if [ -n "${CCACHE}" ]; then
                # Prepare ccache parameter for make
                CCACHE_OPT="ccache=${CCACHE}"

                # If custom ccache folder not specified, will use default one
                #[ -n "${CCACHE_DIR}" ] || CCACHE_DIR="${HOME}/.ccache"

                # Export and prepare ccache storage
                export CCACHE_DIR
                if [ ! -d "${CCACHE_DIR}" ]; then
                        mkdir -p "${CCACHE_DIR}"
                        chmod ug+rwX "${CCACHE_DIR}"
                        ${CCACHE} -C -M 5G
                        cache1=0
                fi
        fi

        # Save ccache size before build
        if [ -z "${cache1}" ]; then
                if [ "${CCACHE_NOSTATS}" == "true" ]; then
                        cache1=$(du -sh ${CCACHE_DIR} | awk '{print $1}')
                else
                        cache1=$(${CCACHE} -s | grep "^cache size" | awk '{print $3$4}')
                fi
        fi
else
        # Clean environment if ccache is not enabled
        unset USE_CCACHE
        unset CCACHE_OPT
        unset CCACHE_DIR
        unset CCACHE_NOSTATS
        unset CCACHE
fi

echo -e "${cya}Building ${bldcya}Android $VERSION for $DEVICE using Java-$JVER${txtrst}";
echo -e "${bldgrn}Start time: $(date) ${txtrst}"

# Print ccache stats
[ -n "${USE_CCACHE}" ] && export USE_CCACHE && echo -e "${cya}Building using CCACHE${txtrst}"
[ -n "${CCACHE_DIR}" ] && export CCACHE_DIR && echo -e "${bldgrn}CCACHE: location = [${txtrst}${grn}${CCACHE_DIR}${bldgrn}], size = [${txtrst}${grn}${cache1}${bldgrn}]${txtrst}"

# Decide what command to execute
case "$EXTRAS" in
        threads)
                echo -e "${bldblu}Please enter desired building/syncing threads number followed by [ENTER]${txtrst}"
                read threads
                THREADS=$threads
        ;;
        clean|cclean)
		# Un-Mount stock image
		if [ $(mount | grep "${DIR}/out/system.ext4" | grep -c "${DIR}/out/stock/system") == 1 ]; then
			echo "${bldblu}Unmounting [${DIR}/out/stock/system]${txtrst}"
			sudo umount "${DIR}/out/stock/system"
		fi

		if [ $(mount | grep "${DIR}/out/system.ext4" | grep -c "${DIR}/out/stock/system") != 0 ]; then
			echo "${bldred}Unmounting failed [${DIR}/out/stock/system]${txtrst}"
			exit 1
		fi

                echo -e "${bldblu}Cleaning intermediates and output files${txtrst}"
                export CLEAN_BUILD="true"
                [ -d "${DIR}/out" ] && rm -Rf ${DIR}/out/*
                # Clean ccache if we have to
                if [ -n "${CCACHE_DIR}" ] && [ $EXTRAS == cclean ]; then
                        echo "${bldblu}Cleaning ccache${txtrst}"
                        ${CCACHE} -C -M 5G
                fi
        ;;
esac

echo -e ""

# Fetch latest sources
if [ "$SYNC" == "true" ]; then
        echo -e "\n${bldblu}Fetching latest sources${txtrst}"
        repo sync -j"$THREADS"
fi

# Print java caveats
if [ ! -r "${DIR}/out/versions_checked.mk" ] && [ -n "$(java -version 2>&1 | grep -i openjdk)" ]; then
        echo -e "\n${bldcya}Your java version still not checked and is candidate to fail, masquerading.${txtrst}"
        JAVA_VERSION="java_version=${JVER}"
fi

if [ -r ${DIR}/vendor/${VENDOR}/get-blobs ]; then
        if [ -r ${DIR}/vendor/${VENDOR}/blobs/.get-blobs ]; then
                echo -e "${bldgrn}Already downloaded blobs${txtrst}"
        else
                echo -e "${bldblu}Fetching blobs${txtrst}"
                pushd ${DIR}/vendor/${VENDOR} > /dev/null
                source ./get-blobs && touch blobs/.get-blobs
                popd > /dev/null
        fi
elif [ -r ${DIR}/vendor/${VENDOR}/get-prebuilts ]; then
        if [ -r ${DIR}/vendor/${VENDOR}/proprietary/.get-prebuilts ]; then
                echo -e "${bldgrn}Already downloaded prebuilts${txtrst}"
        else
                echo -e "${bldblu}Downloading prebuilts${txtrst}"
                pushd ${DIR}/vendor/${VENDOR} > /dev/null
                source ./get-prebuilts && touch proprietary/.get-prebuilts
                popd > /dev/null
        fi
else
        echo -e "${bldcya}No blobs/prebuilts script in this tree${txtrst}"
fi

# Prepare stock image
if [ -r "${STOCK_SYSTEM_IMAGE}" ]; then
	echo -en "${bldblu}Analyzing stock image [${STOCK_SYSTEM_IMAGE}]:${txtrst}"
	SB=`od -A n -h -j 0 -N 6 ${STOCK_SYSTEM_IMAGE} | sed 's/ //g'`
	echo "${SB}"

	if [ ! -r "${DIR}/out/system.ext4" ]; then
		mkdir -p "${DIR}/out"

		if [ "${SB}" == "000000000000" ]; then
			echo -e "${bldblu}Copying image as already in ext4 format${txtrst}"
			cp "${STOCK_SYSTEM_IMAGE}" "${DIR}/out/system.ext4"
		else
			if [ ! -x "${DIR}/out/simg2img" ]; then
				echo -e "${bldblu}Preparing to compile simg2img from source${txtrst}"
				[ -n `which gcc` ] || NEED_PACKAGES="${NEED_PACKAGES} build-essential"
				[ -n `which git` ] || NEED_PACKAGES="${NEED_PACKAGES} git"
				[ -r /usr/include/zlib.h ] || NEED_PACKAGES="${NEED_PACKAGES} zlib1g-dev"
				if [ -n "${NEED_PACKAGES}" ]; then
					echo -e "${bldcya}You need install additional packages:\n$ sudo aptitude install ${NEED_PACKAGES}${txtrst}"
					exit 1
				fi

				echo -e "${bldblu}Compiling simg2img tool${txtrst}"
				cd ${DIR}/system/core/libsparse
				gcc -o ${DIR}/out/simg2img simg2img.c sparse*.c backed_block.c output_file.c -lz -Iinclude
				cd - > /dev/null
			fi

			echo -e "${bldblu}Converting [${STOCK_SYSTEM_IMAGE}] to ext4 format${txtrst}"
			${DIR}/out/simg2img "${STOCK_SYSTEM_IMAGE}" "${DIR}/out/system.ext4" > /dev/null
		fi
	else
                echo -e "${bldblu}[${DIR}/out/system.ext4] already exists${txtrst}"
	fi

	# Mount stock image
	if [ $(mount | grep "${DIR}/out/system.ext4" | grep -c "${DIR}/out/stock/system") == 1 ]; then
                echo -e "${bldblu}[${DIR}/out/stock/system] is already mounted${txtrst}"
	else
                echo -e "${bldblu}Mounting stock image${txtrst}"
		mkdir -p "${DIR}/out/stock/system"

		# For ext4 (To prevent hanging when unmounting, use: ro,noexec,noload)
		sudo mount -o loop,ro,noexec,noload "${DIR}/out/system.ext4" "${DIR}/out/stock/system"
	fi

	# Inject GAPPS (TODO: Validate config location for all ROMs)
#	if [ -r "${DIR}/out/stock/system/build.prop" ] && ! grep -q "common_gapps" "vendor/${VENDOR}/config/common.mk"; then
#		echo -e "${bldblu}Injecting google APPS${txtrst}"
#		echo -e "# Include common stock google apps\n-include vendor/${VENDOR}/config/common_gapps.mk" >> "vendor/${VENDOR}/config/common.mk"
#	else
#		echo -e "${bldcya}Google APPS already injected or something wrong with stock image [${STOCK_SYSTEM_IMAGE}]${txtrst}"
#	fi
else
	echo -e "${bldcya}No stock image provided at [${STOCK_SYSTEM_IMAGE}]${txtrst}"
fi

# Export global variables for build system
export PREFS_FROM_SOURCE
export WITHOUT_PROP_APPS
export WITHOUT_MC
#export DISABLE_DEXPREOPT=false
#export WITH_DEXPREOPT=true

# Decide if we enter interactive mode or default build mode
if [ -n "${INTERACTIVE}" ]; then
        echo -e "\n${bldblu}Enabling interactive mode. Possible commands are:${txtrst}"

        if [ "${VENDOR}" == "cm" ] || [ "${VENDOR}" == "mahdi" ] || [ "${VENDOR}" == "eos" ]; then
                echo -e "To prepare device environment:[${bldgrn}breakfast ${VENDOR_LUNCH}${DEVICE}${txtrst}]"
        else
                echo -e "To prepare device environment:[${bldgrn}lunch ${VENDOR_LUNCH}${DEVICE}-user${txtrst}]"
        fi

        if [ "${VENDOR}" == "aosp" ]; then
                echo -e "To build device:[${bldgrn}make otapackage${txtrst}]"
        else
                echo -e "To build device:[${bldgrn}mka bacon${txtrst}]"
        fi

        echo -e "To see all make commands:[${bldgrn}make help${txtrst}]"
        echo -e "To emulate device:[${bldgrn}vncserver :1; DISPLAY=:1 emulator&${txtrst}]"
        echo -e "You may try to prefix make commands with:[${bldgrn}schedtool -B -n 1 -e ionice -n 1${txtrst}]"
        echo -e "You may try to suffix make commands with:[${bldgrn}-j${THREADS} ${CCACHE_OPT} ${JAVA_VERSION}${txtrst}]"

        # Setup and enter interactive environment
        echo -e "${bldblu}Dropping to interactive shell...${txtrst}"
        bash --init-file ${DIR}/build/envsetup.sh -i
else
	# Optionally switch to ODEX modes
	#if [ "${ODEX_MODE}" == "true" ]; then
	#	sed -i 's/combo-userdebug/combo-user/' "vendor/${VENDOR}/vendorsetup.sh"
	#fi

        # Setup environment
        echo -e "\n${bldblu}Setting up environment${txtrst}"
        . build/envsetup.sh

        # Preparing
        echo -e "\n${bldblu}Preparing device [${DEVICE}]${txtrst}"
        if [ "${VENDOR}" == "cm" ] || [ "${VENDOR}" == "mahdi" ] || [ "${VENDOR}" == "eos" ]; then
                breakfast "${VENDOR_LUNCH}${DEVICE}"
        else
                lunch "${VENDOR_LUNCH}${DEVICE}-user"
        fi

        echo -e "${bldblu}Starting compilation${txtrst}"
        if [ "${VENDOR}" == "aosp" ] || [ "${VENDOR}" == "myaosp" ]; then
                schedtool -B -n 1 -e ionice -n 1 make -j${THREADS} ${CCACHE_OPT} ${JAVA_VERSION} otapackage
        elif [ "${VENDOR}" == "cm" ] || [ "${VENDOR}" == "mahdi" ] || [ "${VENDOR}" == "eos" ]; then
                brunch "${VENDOR_LUNCH}${DEVICE}"
        else
                mka bacon
        fi
fi

# Get and print increased ccache size
if [ -n "${CCACHE_DIR}" ]; then
        if [ "${CCACHE_NOSTATS}" == "true" ]; then
                cache2=$(du -sh ${CCACHE_DIR} | awk '{print $1}')
        else
                cache2=$(prebuilts/misc/linux-x86/ccache/ccache -s | grep "^cache size" | awk '{print $3$4}')
        fi
                echo -e "\n${bldgrn}ccache size is ${txtrst} ${grn}${cache2}${txtrst} (was ${grn}${cache1}${txtrst})"
fi

# Get and print elapsed time
res2=$(date +%s.%N)
echo -e "\n${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}"
