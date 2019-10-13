#
# Copyright (C) 2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

include device/google/marlin/device-common.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/sailfish/overlay

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

# HWUI cache sizes
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=56 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.path_cache_size=16

PRODUCT_COPY_FILES += \
    device/google/marlin/fstab.common:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.sailfish \
    device/google/marlin/audio_platform_info_tasha_sailfish.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    device/google/marlin/init.recovery.common.rc:recovery/root/init.recovery.sailfish.rc

# Sensor packages
PRODUCT_PACKAGES += \
    sensors.sailfish \
    activity_recognition.sailfish

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-nxp.sailfish.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# LED packages
PRODUCT_PACKAGES += \
    lights.sailfish

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.sailfish
