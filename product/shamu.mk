# Inherit AOSP device configuration for shamu
$(call inherit-product, device/moto/shamu/full_shamu.mk)

# Inherit common product files
$(call inherit-product, vendor/myaosp/config/common.mk)
