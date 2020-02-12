PRODUCT_MAKEFILES := \
	$(LOCAL_DIR)/aosp_marlin.mk \
	$(LOCAL_DIR)/aosp_sailfish.mk

PRODUCT_MAKEFILES += \
	$(LOCAL_DIR)/gahs_marlin.mk \
	$(LOCAL_DIR)/gahs_sailfish.mk

COMMON_LUNCH_CHOICES := \
	aosp_marlin-userdebug \
	aosp_sailfish-userdebug

COMMON_LUNCH_CHOICES += \
	gahs_sailfish-userdebug \
	gahs_marlin-userdebug
