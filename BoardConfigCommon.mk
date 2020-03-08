TARGET_BOARD_PLATFORM := msm8996
QCOM_BOARD_PLATFORMS += msm8996
MSM_VIDC_TARGET_LIST := msm8996
MASTER_SIDE_CP_TARGET_LIST := msm8996

TARGET_USES_INTERACTION_BOOST := true

TARGET_USES_AOSP := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_USES_WIPOWER := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/google/marlin/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_USES_SDM845_BLUETOOTH_HAL := true
BOARD_HAS_QCA_BT_ROME := true
WCNSS_FILTER_USES_SIBS := true

# WLAN
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Overridings Commands
BUILD_BROKEN_DUP_RULES := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096

BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240

BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_VENDORIMAGE_PARTITION_SIZE := 314572800
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Board uses A/B OTA.
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := device/google/marlin/recovery.wipe.common
TARGET_RECOVERY_FSTAB := device/google/marlin/fstab.common

BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

TARGET_USES_ION := true

BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += androidboot.console=ttyHSL0
BOARD_KERNEL_CMDLINE += user_debug=31
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += cma=32M@0-0xffffffff
BOARD_KERNEL_CMDLINE += loop.max_part=7

BOARD_ROOT_EXTRA_FOLDERS := firmware firmware/radio persist
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/lib/dsp:/dsp

BOARD_VENDOR_SEPOLICY_DIRS += device/google/marlin/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/marlin/sepolicy/verizon
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := device/google/marlin/sepolicy/public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := device/google/marlin/sepolicy/private

TARGET_FS_CONFIG_GEN := device/google/marlin/config.fs

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
ifneq ($(filter sailfish_kasan marlin_kasan, $(TARGET_PRODUCT)),)
BOARD_KERNEL_OFFSET      := 0x80000
BOARD_KERNEL_TAGS_OFFSET := 0x02500000
BOARD_RAMDISK_OFFSET     := 0x02700000
BOARD_MKBOOTIMG_ARGS     := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
else
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x02200000
endif

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := marlin_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.lz4-dtb
TARGET_KERNEL_SOURCE := kernel/google/marlin
#TARGET_KERNEL_CLANG_COMPILE := true
#TARGET_KERNEL_CLANG_VERSION := r370808
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_BOARD_KERNEL_HEADERS := device/google/marlin/kernel-headers

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_NO_RPC := true

# Let charger mode enter suspend
BOARD_CHARGER_ENABLE_SUSPEND := true

# Camera HAL
CAMERA_DAEMON_NOT_PRESENT := true
BOARD_QTI_CAMERA_32BIT_ONLY := true

TARGET_RECOVERY_UI_LIB := librecovery_ui_nanohub libbootloader_message libfstab

# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/sailin-setup.sh

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

DEVICE_MANIFEST_FILE := device/google/marlin/manifest.xml
DEVICE_MATRIX_FILE   := device/google/marlin/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/google/marlin/device_framework_matrix.xml

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

TARGET_FLATTEN_APEX := true

-include vendor/google_devices/marlin/BoardConfigVendor.mk
