# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Inherit Bootleggers product configuration
$(call inherit-product, vendor/liquid/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

include device/google/marlin/device-liquid.mk

export LIQUID_BUILDTYPE=RELEASE

## Device identifier. This must come after all inclusions
PRODUCT_NAME := liquid_marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PQ2A.190405.003 5310204 release-keys"

BUILD_FINGERPRINT := google/marlin/marlin:9/PQ2A.190405.003/5310204:user/release-keys
