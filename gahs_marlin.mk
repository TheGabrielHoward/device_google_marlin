#
# Copyright (C) 2020 shagbag913
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/google/marlin/aosp_marlin.mk)
$(call inherit-product, vendor/gahs/config/common.mk)
$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)

TARGET_SCREEN_WIDTH := 1440
TARGET_SCREEN_HEIGHT := 2560

PRODUCT_NAME := gahs_marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
PRODUCT_RESTRICT_VENDOR_FILES := false
