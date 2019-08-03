# Inherit some common  Evolution X stuff.
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_BOOT_ANIMATION_RES_EVO := true
TARGET_GAPPS_ARCH := arm64
CUSTOM_BUILD_TYPE := OFFICIAL
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/full_marlin.mk)

include device/google/marlin/device-liquid.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aosp_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PQ3A.190705.001 5565753 release-keys"

BUILD_FINGERPRINT="google/marlin/marlin:9/PQ3A.190705.001/5565753:user/release-keys"
