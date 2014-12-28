# Local path for blobs
BLOBS_PATH:= vendor/myaosp/blobs

# Stock permissions
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/etc/permissions/com.google.android.camera2.xml:system/etc/permissions/com.google.android.camera2.xml \
    $(BLOBS_PATH)/system.mnt/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    $(BLOBS_PATH)/system.mnt/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    $(BLOBS_PATH)/system.mnt/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    $(BLOBS_PATH)/system.mnt/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml

# Stock preferences
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml

# Stock frameworks
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/framework/com.android.location.provider.jar:system/framework/com.android.location.provider.jar \
    $(BLOBS_PATH)/system.mnt/framework/com.google.android.camera2.jar:system/framework/com.google.android.camera2.jar \
    $(BLOBS_PATH)/system.mnt/framework/com.google.android.dialer.support.jar:system/framework/com.google.android.dialer.support.jar \
    $(BLOBS_PATH)/system.mnt/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    $(BLOBS_PATH)/system.mnt/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    $(BLOBS_PATH)/system.mnt/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar

# Stock libraries
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinime.so

# Stock applications
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleContacts/GoogleContacts.apk:system/priv-app/GoogleContacts/GoogleContacts.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleContacts/arm/GoogleContacts.odex:system/priv-app/GoogleContacts/arm/GoogleContacts.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleDialer/GoogleDialer.apk:system/priv-app/GoogleDialer/GoogleDialer.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleDialer/arm/GoogleDialer.odex:system/priv-app/GoogleDialer/arm/GoogleDialer.odex \
    $(BLOBS_PATH)/system.mnt/lib/libvariablespeed.so:system/priv-app/GoogleDialer/lib/arm/libvariablespeed.so \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk:system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleBackupTransport/arm/GoogleBackupTransport.odex:system/priv-app/GoogleBackupTransport/arm/GoogleBackupTransport.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleFeedback/GoogleFeedback.apk:system/priv-app/GoogleFeedback/GoogleFeedback.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleFeedback/arm/GoogleFeedback.odex:system/priv-app/GoogleFeedback/arm/GoogleFeedback.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleLoginService/GoogleLoginService.apk:system/priv-app/GoogleLoginService/GoogleLoginService.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleLoginService/arm/GoogleLoginService.odex:system/priv-app/GoogleLoginService/arm/GoogleLoginService.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk:system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleOneTimeInitializer/arm/GoogleOneTimeInitializer.odex:system/priv-app/GoogleOneTimeInitializer/arm/GoogleOneTimeInitializer.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk:system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GooglePartnerSetup/arm/GooglePartnerSetup.odex:system/priv-app/GooglePartnerSetup/arm/GooglePartnerSetup.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk:system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/GoogleServicesFramework/arm/GoogleServicesFramework.odex:system/priv-app/GoogleServicesFramework/arm/GoogleServicesFramework.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/Phonesky/Phonesky.apk:system/priv-app/Phonesky/Phonesky.apk \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk:system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so:system/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libgames_rtmp_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgames_rtmp_jni.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so:system/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so \
    $(BLOBS_PATH)/system.mnt/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so:system/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/SetupWizard/SetupWizard.apk:system/priv-app/SetupWizard/SetupWizard.apk \
    $(BLOBS_PATH)/system.mnt/priv-app/SetupWizard/arm/SetupWizard.odex:system/priv-app/SetupWizard/arm/SetupWizard.odex \
    \
    $(BLOBS_PATH)/system.mnt/priv-app/Velvet/Velvet.apk:system/priv-app/Velvet/Velvet.apk \
    $(BLOBS_PATH)/system.mnt/lib/libgoogle_hotword_jni.so:system/priv-app/Velvet/lib/arm/libgoogle_hotword_jni.so \
    $(BLOBS_PATH)/system.mnt/lib/libgoogle_recognizer_jni_l.so:system/priv-app/Velvet/lib/arm/libgoogle_recognizer_jni_l.so \
    $(BLOBS_PATH)/system.mnt/lib/libvcdecoder_jni.so:system/priv-app/Velvet/lib/arm/libvcdecoder_jni.so

# Stock speech engine
PRODUCT_COPY_FILES += \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/clg:system/usr/srec/en-US/clg \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/commands.abnf:system/usr/srec/en-US/commands.abnf \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/dict:system/usr/srec/en-US/dict \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/dnn:system/usr/srec/en-US/dnn \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/ep_acoustic_model:system/usr/srec/en-US/ep_acoustic_model \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hclg_shotword:system/usr/srec/en-US/hclg_shotword \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hmmlist:system/usr/srec/en-US/hmmlist \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hmm_symbols:system/usr/srec/en-US/hmm_symbols \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hotword_classifier:system/usr/srec/en-US/hotword_classifier \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hotword.config:system/usr/srec/en-US/hotword.config \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hotword_normalizer:system/usr/srec/en-US/hotword_normalizer \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hotword_prompt.txt:system/usr/srec/en-US/hotword_prompt.txt \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/hotword_word_symbols:system/usr/srec/en-US/hotword_word_symbols \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/normalizer:system/usr/srec/en-US/normalizer \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/offensive_word_normalizer:system/usr/srec/en-US/offensive_word_normalizer \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/phone_state_map:system/usr/srec/en-US/phone_state_map \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/rescoring_lm:system.mnt/usr/srec/en-US/rescoring_lm \
    $(BLOBS_PATH)/system.mnt/usr/srec/en-US/wordlist:system/usr/srec/en-US/wordlist
