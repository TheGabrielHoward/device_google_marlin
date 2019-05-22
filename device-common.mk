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

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

PRODUCT_SHIPPING_API_LEVEL := 25

VENDOR_SECURITY_PATCH := 2019-10-05

PRODUCT_SOONG_NAMESPACES += \
    device/google/marlin \
    vendor/google/camera \
    hardware/google/pixel

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Input device files
PRODUCT_COPY_FILES += \
    device/google/marlin/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    device/google/marlin/qpnp_pon.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/qpnp_pon.kl \
    device/google/marlin/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    device/google/marlin/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    device/google/marlin/synaptics_dsxv26.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsxv26.idc \
    frameworks/native/services/vr/virtual_touchpad/idc/vr-virtual-touchpad-0.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/vr-virtual-touchpad-0.idc \
    frameworks/native/services/vr/virtual_touchpad/idc/vr-virtual-touchpad-1.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/vr-virtual-touchpad-1.idc \

# copy customized media_profiles and media_codecs xmls for msm8996
PRODUCT_COPY_FILES += \
    device/google/marlin/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/google/marlin/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    device/google/marlin/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    ro.telephony.default_cdma_sub=0

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/google/marlin/utils.mk)

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# b/73640835
PRODUCT_PROPERTY_OVERRIDES += \
    sdm.debug.rotator_downscale=1

# Disable buffer age (b/74534157)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false

# HWUI common settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files \
    fs_config_dirs

# Audio configuration
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    device/google/marlin/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    device/google/marlin/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/google/marlin/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/google/marlin/mixer_paths_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha_t50.xml \
    device/google/marlin/aanc_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/aanc_tuning_mixer.txt \
    device/google/marlin/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    device/google/marlin/sound_trigger_mixer_paths_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_tasha_t50.xml \
    device/google/marlin/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    device/google/marlin/audio_platform_info_tasha_t50.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha_t50.xml \
    device/google/marlin/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/google/marlin/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    device/google/marlin/audio_policy_volumes_drc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_drc.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

# Enable AAudio MMAP/NOIRQ data path.
# 2 is AAUDIO_POLICY_AUTO so it will try MMAP then fallback to Legacy path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
# Allow EXCLUSIVE then fall back to SHARED.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2

# Increase the apparent size of a hardware burst from 1 msec to 2 msec.
# A "burst" is the number of frames processed at one time.
# That is an increase from 48 to 96 frames at 48000 Hz.
# The DSP will still be bursting at 48 frames but AAudio will think the burst is 96 frames.
# A low number, like 48, might increase power consumption or stress the system.
PRODUCT_PROPERTY_OVERRIDES += aaudio.hw_burst_min_usec=2000

PRODUCT_FULL_TREBLE_OVERRIDE := true

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.pixel-libperfmgr

# Power hint
PRODUCT_COPY_FILES += \
    device/google/marlin/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Memtrack HAL
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl \
    memtrack.msm8996

# Camera HAL
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    camera.msm8996 \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmmlib2d_interface \
    libmm-qcamera \
    libqomx_core

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service \
    android.hardware.light@2.0-impl:64 \
    lights.msm8996

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl:64 \
    android.hardware.keymaster@3.0-service

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.marlin

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl:32 \
    android.hardware.drm@1.2-service.clearkey

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    media.mediadrmservice.enable=true \

# Audio effects
PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    audio.primary.msm8996 \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.hearing_aid.default \
    sound_trigger.primary.msm8996 \
    android.hardware.audio@2.0-service \
    android.hardware.audio@5.0-impl:32 \
    android.hardware.audio.effect@5.0-impl:32 \
    android.hardware.soundtrigger@2.2-impl:32

# Audio test apps
PRODUCT_PACKAGES_DEBUG += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo \
    cplay

# Stagefright configuration
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml

PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# set audio fluence, ns, aec property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluencepro \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=false

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    device/google/marlin/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf     \
    device/google/marlin/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf     \
    device/google/marlin/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/google/marlin/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Audio low latency feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml

# Pro audio feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-service.marlin

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

# Networking CLI tools
PRODUCT_PACKAGES_DEBUG += \
    hostapd_cli \
    wpa_cli \
    rmnetcli

# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# VR features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vr.headtracking-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.headtracking.xml \

# new gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

# Common sensor packages
TARGET_USES_NANOHUB_SENSORHAL := true
NANOHUB_SENSORHAL_LID_STATE_ENABLED := true
NANOHUB_SENSORHAL_SENSORLIST := device/google/marlin/sensorhal/sensorlist.cpp
NANOHUB_SENSORHAL_DIRECT_REPORT_ENABLED := true
NANOHUB_SENSORHAL_DYNAMIC_SENSOR_EXT_ENABLED := true

# Sensor HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \
    android.hardware.contexthub@1.0-service \
    android.hardware.contexthub@1.0-impl.nanohub:64 \
    libsensorndkbridge

# Sensor utilities
PRODUCT_PACKAGES_DEBUG += \
    nanotool \
    nanoapp_cmd \
    sensortest

PRODUCT_COPY_FILES += \
    device/google/marlin/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# init scripts
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.rc \
    device/google/marlin/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.usb.rc \
    device/google/marlin/init.common.nanohub.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.nanohub.rc \
    device/google/marlin/ueventd.common.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    device/google/marlin/init.radio.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.radio.sh \
    device/google/marlin/init.power.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.power.sh \
    device/google/marlin/init.mid.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mid.sh \
    device/google/marlin/init.foreground.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.foreground.sh \
    device/google/marlin/init.qcom.devstart.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.devstart.sh

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

# Write Manufacturer & Model information in created media files.
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true

# By default, enable zram; experiment can toggle the flag,
# which takes effect on boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.zram_enabled=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.gyro.android=4 \
    persist.camera.tof.direct=1 \
    persist.camera.tnr.preview=1 \
    persist.camera.tnr.video=1 \
    persist.camera.perflock.enable=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.custom_ecc=1 \
    persist.radio.data_ltd_sys_ind=1 \
    persist.radio.is_wps_enabled=true \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.sw_mbn_update=1 \
    persist.radio.videopause.mode=1 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.radio.data_con_rprt=true \
    persist.radio.sib16_support=1 \
    persist.rcs.supported=1 \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent

# Enable SM log mechanism by default
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.smlog_switch=1 \
    ro.radio.log_prefix="modem_log_" \
    ro.radio.log_loc="/data/smlog_dump"
endif

# Disable snapshot feature
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.snapshot_enabled=0 \
    persist.radio.snapshot_timer=0

# IMS over WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1

PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_CHARACTERISTICS := nosdcard

# Enable camera EIS
# eis.enable: enables electronic image stabilization
# is_type: sets image stabilization type
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.eis.enable=1 \
    persist.camera.is_type=4

# Fingerprint HIDL implementation
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Modem debugger
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.diag.rc

# Subsystem ramdump
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.enable_ramdumps=1
else
PRODUCT_COPY_FILES += \
    device/google/marlin/init.common.diag.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.diag.rc
endif

# Subsystem silent restart
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.restart_level=venus,AR6320,slpi,modem,adsp

PRODUCT_COPY_FILES += \
    device/google/marlin/thermal-engine-marlin-novr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-novr.conf \
    device/google/marlin/thermal-engine-marlin-vr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-vr.conf

$(call inherit-product-if-exists, hardware/qcom/msm8996/msm8996.mk)

# Needed for encryption
PRODUCT_PACKAGES += \
    keystore.msm8996 \
    gatekeeper.msm8996

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-qti:64 \
    android.hardware.bluetooth@1.0-service-qti \
    android.hardware.bluetooth@1.0-service-qti.rc \
    android.hardware.bluetooth.audio@2.0-impl \

# Bluetooth SoC
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=rome

# Property for loading BDA from bdaddress module in kernel
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.bt.bdaddr_path=/sys/module/bdaddress/parameters/bdaddress

# Bluetooth WiPower
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.bluetooth.emb_wp_mode=true \
    ro.vendor.bluetooth.wipower=true

PRODUCT_PACKAGES += \
    libbt-vendor

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    android.hardware.nfc@1.1-service

# GPS
PRODUCT_PACKAGES += \
    gps.default \
    libgps.utils \
    libloc_eng \
    libloc_api_v02 \
    libloc_ds_api

# Secure Element Service
PRODUCT_PACKAGES += \
    SecureElement

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-service \
    android.hardware.gnss@1.0-impl:64

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.marlin

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.pixel

PRODUCT_COPY_FILES += \
    device/google/marlin/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.thermal.config=thermal_info_config.json

# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl:64 \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    gralloc.default \
    gralloc.msm8996

PRODUCT_PACKAGES += \
    libqdutils \
    libqdMetaData

# HW Composer
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl:64 \
    android.hardware.graphics.composer@2.1-service \
    hwcomposer.msm8996

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl:64 \
    android.hardware.boot@1.0-impl.recovery:64 \
    android.hardware.boot@1.0-service

# Library used for VTS tests
PRODUCT_PACKAGES_DEBUG += \
     libvts_profiling \
     libvts_multidevice_proto

# Vidc
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PACKAGES += \
    libstagefright_soft_flacdec

# NFC/camera interaction workaround - DO NOT COPY TO NEW DEVICES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.notify_nfc=1

PRODUCT_COPY_FILES += \
    device/google/marlin/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    device/google/marlin/nfc/libpn551_fw.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpn551_fw.so

# Bootloader HAL used for A/B updates.
PRODUCT_PACKAGES += \
    bootctrl.msm8996 \
    bootctrl.msm8996.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Storage: for factory reset protection feature
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/soc/624000.ufshc/by-name/frp

PRODUCT_PROPERTY_OVERRIDES += \
    sdm.debug.disable_rotator_split=1 \
    qdcm.only_pcc_for_trans=1 \
    qdcm.diagonal_matrix_mode=1

# Enable low power video mode for 4K encode
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.perf.mode=2

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# Setup dm-verity configs
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/624000.ufshc/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/624000.ufshc/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# GPS configuration file
PRODUCT_COPY_FILES += \
    device/google/marlin/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Default permission grant exceptions
PRODUCT_COPY_FILES += \
    device/google/marlin/default-permissions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default-permissions/default-permissions.xml

# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Reduce cost of scrypt for FBE CE decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.scrypt_params=13:3:1

# Set if a device image has the VTS coverage instrumentation.
ifeq ($(NATIVE_COVERAGE),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vts.coverage=1
PRODUCT_SUPPORTS_VERITY_FEC := false
endif

# b/35633646
# Statically linked toybox for modprobe in recovery mode
PRODUCT_PACKAGES += \
    toybox_static

# b/30349163
# Set Marlin/Sailfish default log size on userdebug/eng build to 1M
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += ro.logd.size=1M
endif

# b/32109329
# Workaround for audio glitches
PRODUCT_PROPERTY_OVERRIDES += \
    audio.adm.buffering.ms=3

# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
    device/google/marlin/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# whitelisted app
PRODUCT_COPY_FILES += \
    device/google/marlin/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Privileged permissions whitelist
PRODUCT_COPY_FILES += \
    device/google/marlin/permissions/privapp-permissions-marlin.xml:system/etc/permissions/privapp-permissions-marlin.xml

PRODUCT_PACKAGES += \
    vndk-sp

# Marlin/Sailfish kernel doesn't have HEH filename encryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Enable Perfetto traced
PRODUCT_PROPERTY_OVERRIDES += \
    persist.traced.enable=1

# health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.marlin

# default atrace HAL
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# a_sns_test for sensor testing
PRODUCT_PACKAGES_DEBUG += \
    a_sns_test

# Write flags to the vendor space in /misc partition.
PRODUCT_PACKAGES += \
    misc_writer

# EGL library suffix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=adreno

# Tools
PRODUCT_PACKAGES += \
    libtinyxml \
    gzip \
    libxml2

# VR Services
PRODUCT_PACKAGES += \
    bufferhubd \
    performanced \
    virtual_touchpad \
    vr_hwc

# Preopt SystemUI with speed profile
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

PRODUCT_LOADED_BY_PRIVILEGED_MODULES += \
    qti-vzw-ims-internal \
    qcrilhook \
    ims \
    Stk \
    embmslibrary \
    datastatusnotification \
    VZWAPNLib \
    UserDictionaryProvider

# IMS
PRODUCT_PACKAGES += \
    imssettings \
    ims-ext-common \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Data services
PRODUCT_PACKAGES += \
    librmnetctl

# GApps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
