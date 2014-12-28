# Common build prop overrides 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=dd-mm-yyyy \
    ro.com.android.dataroaming=false \
    keyguard.no_require_sim=true

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


# Un-Needed packages
PRODUCT_PURGE_PACKAGES += \
    Launcher2

# Purge packages
$(foreach p,$(PRODUCT_PURGE_PACKAGES),$(eval $(PRODUCT_PACKAGES) := $(filter-out $(PRODUCT_PACKAGES),$(p))))

# Extra packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Email \
    Exchange2 \
    Contacts \
    Dialer \
    Mms

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# Koush's Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser
PRODUCT_PACKAGES += \
    Superuser \
    su
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/myaosp/overlay

# Include common stock google apps
-include vendor/myaosp/products/gapps.mk
