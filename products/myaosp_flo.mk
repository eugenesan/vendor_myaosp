# Inherit AOSP device configuration for flo
$(call inherit-product, device/asus/flo/full_flo.mk)

# Inherit common product files
$(call inherit-product, vendor/myaosp/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := myaosp_flo
PRODUCT_BRAND := google
PRODUCT_DEVICE := flo
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := ASUS

# Build prop fingerprint overrides
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="razor" BUILD_FINGERPRINT="google/razor/flo:5.0/LRX21Q/1570415:user/release-keys" PRIVATE_BUILD_DESC="razor-user 5.0 LRX21Q 1570415 release-keys"