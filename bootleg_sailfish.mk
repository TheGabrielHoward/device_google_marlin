# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit Bootleggers product configuration
$(call inherit-product, vendor/bootleggers/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_sailfish.mk)

include device/google/marlin/device-bootleg.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := bootleg_sailfish
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel
TARGET_MANUFACTURER := Google
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sailfish \
    PRIVATE_BUILD_DESC="sailfish-user 9 PQ1A.190105.004 5148680 release-keys"

BUILD_FINGERPRINT := google/sailfish/sailfish:9/PQ1A.190105.004/5148680:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootleggers.maintainer=shagbag913
