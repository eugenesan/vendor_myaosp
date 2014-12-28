# Local path for stock filesystem
STOCK_PATH:= out/stock

# Stock permissions
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/etc/permissions/com.google.android.camera2.xml:system/etc/permissions/com.google.android.camera2.xml \
    $(STOCK_PATH)/system/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    $(STOCK_PATH)/system/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    $(STOCK_PATH)/system/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    $(STOCK_PATH)/system/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml

# Stock preferences
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml

# Stock frameworks
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/framework/android.test.runner.jar:system/framework/android.test.runner.jar \
    $(STOCK_PATH)/system/framework/arm/android.test.runner.odex:system/framework/arm/android.test.runner.odex \
    \
    $(STOCK_PATH)/system/framework/com.android.location.provider.jar:system/framework/com.android.location.provider.jar \
    $(STOCK_PATH)/system/framework/arm/com.android.location.provider.odex:system/framework/arm/com.android.location.provider.odex \
    \
    $(STOCK_PATH)/system/framework/com.android.media.remotedisplay.jar:system/framework/com.android.media.remotedisplay.jar \
    $(STOCK_PATH)/system/framework/arm/com.android.media.remotedisplay.odex:system/framework/arm/com.android.media.remotedisplay.odex \
    \
    $(STOCK_PATH)/system/framework/com.android.nfc_extras.jar:system/framework/com.android.nfc_extras.jar \
    $(STOCK_PATH)/system/framework/arm/com.android.nfc_extras.odex:system/framework/arm/com.android.nfc_extras.odex \
    \
    $(STOCK_PATH)/system/framework/com.google.android.camera2.jar:system/framework/com.google.android.camera2.jar \
    $(STOCK_PATH)/system/framework/arm/com.google.android.camera2.odex:system/framework/arm/com.google.android.camera2.odex \
    \
    $(STOCK_PATH)/system/framework/com.google.android.dialer.support.jar:system/framework/com.google.android.dialer.support.jar \
    $(STOCK_PATH)/system/framework/arm/com.google.android.dialer.support.odex:system/framework/arm/com.google.android.dialer.support.odex \
    \
    $(STOCK_PATH)/system/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    $(STOCK_PATH)/system/framework/arm/com.google.android.maps.odex:system/framework/arm/com.google.android.maps.odex \
    \
    $(STOCK_PATH)/system/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    $(STOCK_PATH)/system/framework/arm/com.google.android.media.effects.odex:system/framework/arm/com.google.android.media.effects.odex \
    \
    $(STOCK_PATH)/system/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    $(STOCK_PATH)/system/framework/arm/com.google.widevine.software.drm.odex:system/framework/arm/com.google.widevine.software.drm.odex

# Stock libraries
#PRODUCT_COPY_FILES += \
#    $(STOCK_PATH)/system/lib/libjni_latinimegoogle.so:system/lib/libjni_latinime.so

# Stock applications and providers
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/priv-app/GoogleContacts/GoogleContacts.apk:system/priv-app/GoogleContacts/GoogleContacts.apk \
    $(STOCK_PATH)/system/priv-app/GoogleContacts/arm/GoogleContacts.odex:system/priv-app/GoogleContacts/arm/GoogleContacts.odex \
    \
    $(STOCK_PATH)/system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk:system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk \
    $(STOCK_PATH)/system/priv-app/GoogleBackupTransport/arm/GoogleBackupTransport.odex:system/priv-app/GoogleBackupTransport/arm/GoogleBackupTransport.odex \
    \
    $(STOCK_PATH)/system/priv-app/GoogleFeedback/GoogleFeedback.apk:system/priv-app/GoogleFeedback/GoogleFeedback.apk \
    $(STOCK_PATH)/system/priv-app/GoogleFeedback/arm/GoogleFeedback.odex:system/priv-app/GoogleFeedback/arm/GoogleFeedback.odex \
    \
    $(STOCK_PATH)/system/priv-app/GoogleLoginService/GoogleLoginService.apk:system/priv-app/GoogleLoginService/GoogleLoginService.apk \
    $(STOCK_PATH)/system/priv-app/GoogleLoginService/arm/GoogleLoginService.odex:system/priv-app/GoogleLoginService/arm/GoogleLoginService.odex \
    \
    $(STOCK_PATH)/system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk:system/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk \
    $(STOCK_PATH)/system/priv-app/GoogleOneTimeInitializer/arm/GoogleOneTimeInitializer.odex:system/priv-app/GoogleOneTimeInitializer/arm/GoogleOneTimeInitializer.odex \
    \
    $(STOCK_PATH)/system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk:system/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk \
    $(STOCK_PATH)/system/priv-app/GooglePartnerSetup/arm/GooglePartnerSetup.odex:system/priv-app/GooglePartnerSetup/arm/GooglePartnerSetup.odex \
    \
    $(STOCK_PATH)/system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk:system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk \
    $(STOCK_PATH)/system/priv-app/GoogleServicesFramework/arm/GoogleServicesFramework.odex:system/priv-app/GoogleServicesFramework/arm/GoogleServicesFramework.odex \
    \
    $(STOCK_PATH)/system/priv-app/Phonesky/Phonesky.apk:system/priv-app/Phonesky/Phonesky.apk \
    \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk:system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so:system/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libgames_rtmp_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgames_rtmp_jni.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so:system/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so \
    $(STOCK_PATH)/system/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so:system/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so \
    \
    $(STOCK_PATH)/system/priv-app/SetupWizard/SetupWizard.apk:system/priv-app/SetupWizard/SetupWizard.apk \
    $(STOCK_PATH)/system/priv-app/SetupWizard/arm/SetupWizard.odex:system/priv-app/SetupWizard/arm/SetupWizard.odex \
    \
    $(STOCK_PATH)/system/priv-app/Velvet/Velvet.apk:system/priv-app/Velvet/Velvet.apk \
    $(STOCK_PATH)/system/lib/libgoogle_hotword_jni.so:system/priv-app/Velvet/lib/arm/libgoogle_hotword_jni.so \
    $(STOCK_PATH)/system/lib/libgoogle_recognizer_jni_l.so:system/priv-app/Velvet/lib/arm/libgoogle_recognizer_jni_l.so \
    $(STOCK_PATH)/system/lib/libvcdecoder_jni.so:system/priv-app/Velvet/lib/arm/libvcdecoder_jni.so \
    \
    $(STOCK_PATH)/system/priv-app/CalendarProvider/CalendarProvider.apk:system/priv-app/CalendarProvider/CalendarProvider.apk \
    $(STOCK_PATH)/system/priv-app/CalendarProvider/arm/CalendarProvider.odex:system/priv-app/CalendarProvider/arm/CalendarProvider.odex \
    \
    $(STOCK_PATH)/system/app/PrebuiltExchange3Google/PrebuiltExchange3Google.apk:app/PrebuiltExchange3Google/PrebuiltExchange3Google.apk
#    \
#    $(STOCK_PATH)/system/priv-app/GoogleDialer/GoogleDialer.apk:system/priv-app/GoogleDialer/GoogleDialer.apk \
#    $(STOCK_PATH)/system/priv-app/GoogleDialer/arm/GoogleDialer.odex:system/priv-app/GoogleDialer/arm/GoogleDialer.odex \
#    $(STOCK_PATH)/system/lib/libvariablespeed.so:system/priv-app/GoogleDialer/lib/arm/libvariablespeed.so \
#    \
#    $(STOCK_PATH)/system/priv-app/TagGoogle/TagGoogle.apk:system/priv-app/TagGoogle/TagGoogle.apk \
#    $(STOCK_PATH)/system/priv-app/TagGoogle/arm/TagGoogle.odex:system/priv-app/TagGoogle/arm/TagGoogle.odex

#    $(STOCK_PATH)/system/app/GoogleHome/GoogleHome.apk:system/app/GoogleHome/GoogleHome.apk \
#    $(STOCK_PATH)/system/app/GoogleCamera/GoogleCamera.apk:system/app/GoogleCamera/GoogleCamera.apk \
#    $(STOCK_PATH)/system/app/GoogleCamera/arm/GoogleCamera.odex:system/app/GoogleCamera/arm/GoogleCamera.odex \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libRSSupport.so:system/app/GoogleCamera/lib/arm/libRSSupport.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libgcam.so:system/app/GoogleCamera/lib/arm/libgcam.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libgcam_swig_jni.so:system/app/GoogleCamera/lib/arm/libgcam_swig_jni.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libjni_jpegutil.so:system/app/GoogleCamera/lib/arm/libjni_jpegutil.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libjni_tinyplanet.so:system/app/GoogleCamera/lib/arm/libjni_tinyplanet.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libjpeg.so:system/app/GoogleCamera/lib/arm/libjpeg.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/liblightcycle.so:system/app/GoogleCamera/lib/arm/liblightcycle.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/libnativehelper_compat_libc++.so:system/app/GoogleCamera/lib/arm/libnativehelper_compat_libc++.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/librefocus.so:system/app/GoogleCamera/lib/arm/librefocus.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/librs.layered_filter_f32.so:system/app/GoogleCamera/lib/arm/librs.layered_filter_f32.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/librs.layered_filter_fast_f32.so:system/app/GoogleCamera/lib/arm/librs.layered_filter_fast_f32.so \
#    $(STOCK_PATH)/system/app/GoogleCamera/lib/arm/librsjni.so:system/app/GoogleCamera/lib/arm/librsjni.so \

# Stock speech engine
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst \
    $(STOCK_PATH)/system/usr/srec/en-US/clg:system/usr/srec/en-US/clg \
    $(STOCK_PATH)/system/usr/srec/en-US/commands.abnf:system/usr/srec/en-US/commands.abnf \
    $(STOCK_PATH)/system/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config \
    $(STOCK_PATH)/system/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf \
    $(STOCK_PATH)/system/usr/srec/en-US/dict:system/usr/srec/en-US/dict \
    $(STOCK_PATH)/system/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config \
    $(STOCK_PATH)/system/usr/srec/en-US/dnn:system/usr/srec/en-US/dnn \
    $(STOCK_PATH)/system/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config \
    $(STOCK_PATH)/system/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config \
    $(STOCK_PATH)/system/usr/srec/en-US/ep_acoustic_model:system/usr/srec/en-US/ep_acoustic_model \
    $(STOCK_PATH)/system/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst \
    $(STOCK_PATH)/system/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config \
    $(STOCK_PATH)/system/usr/srec/en-US/hclg_shotword:system/usr/srec/en-US/hclg_shotword \
    $(STOCK_PATH)/system/usr/srec/en-US/hmmlist:system/usr/srec/en-US/hmmlist \
    $(STOCK_PATH)/system/usr/srec/en-US/hmm_symbols:system/usr/srec/en-US/hmm_symbols \
    $(STOCK_PATH)/system/usr/srec/en-US/hotword_classifier:system/usr/srec/en-US/hotword_classifier \
    $(STOCK_PATH)/system/usr/srec/en-US/hotword.config:system/usr/srec/en-US/hotword.config \
    $(STOCK_PATH)/system/usr/srec/en-US/hotword_normalizer:system/usr/srec/en-US/hotword_normalizer \
    $(STOCK_PATH)/system/usr/srec/en-US/hotword_prompt.txt:system/usr/srec/en-US/hotword_prompt.txt \
    $(STOCK_PATH)/system/usr/srec/en-US/hotword_word_symbols:system/usr/srec/en-US/hotword_word_symbols \
    $(STOCK_PATH)/system/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata \
    $(STOCK_PATH)/system/usr/srec/en-US/normalizer:system/usr/srec/en-US/normalizer \
    $(STOCK_PATH)/system/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst \
    $(STOCK_PATH)/system/usr/srec/en-US/offensive_word_normalizer:system/usr/srec/en-US/offensive_word_normalizer \
    $(STOCK_PATH)/system/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist \
    $(STOCK_PATH)/system/usr/srec/en-US/phone_state_map:system/usr/srec/en-US/phone_state_map \
    $(STOCK_PATH)/system/usr/srec/en-US/rescoring_lm:system/usr/srec/en-US/rescoring_lm \
    $(STOCK_PATH)/system/usr/srec/en-US/wordlist:system/usr/srec/en-US/wordlist

# Stock face recognision
PRODUCT_COPY_FILES += \
    $(STOCK_PATH)/system/app/FaceLock/FaceLock.apk:system/app/FaceLock/FaceLock.apk \
    $(STOCK_PATH)/system/app/FaceLock/arm/FaceLock.odex:system/app/FaceLock/arm/FaceLock.odex \
    $(STOCK_PATH)/system/lib/libfacelock_jni.so:system/app/FaceLock/lib/arm/libfacelock_jni.so \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/landmark_group_meta_data.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/landmark_group_meta_data.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-3-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-3-tree7-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-r0-ri30.4a-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-r0-ri30.4a-v24-tree7-2-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rn30-ri30.5-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rn30-ri30.5-v24-tree7-2-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rp30-ri30.5-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rp30-ri30.5-v24-tree7-2-wmd.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-r.8.1.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-r.8.1.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-y-r.8.1.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-y-r.8.1.bin \
    $(STOCK_PATH)/system/vendor/pittpatt/models/recognition/face.face.y0-y0-71-N-tree_7-wmd.bin:system/vendor/pittpatt/models/recognition/face.face.y0-y0-71-N-tree_7-wmd.bin

# Stock media files
#PRODUCT_COPY_FILES += \
#    $(STOCK_PATH)/system/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
#    $(STOCK_PATH)/system/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
#    \
#    $(STOCK_PATH)/system/framework/system/framework/arm/qcrilhook.jar:system/framework/system/framework/arm/qcrilhook.jar \
#    $(STOCK_PATH)/system/framework/arm/system/framework/arm/qcrilhook.odex:system/framework/arm/system/framework/arm/qcrilhook.odex
