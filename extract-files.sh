#!/bin/bash
#
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e

VENDOR=google

# Load extractutils and do some sanity checks
MY_DIR=$PWD
LINEAGE_ROOT=$MY_DIR/../../..
HELPER=$LINEAGE_ROOT/vendor/lineage/build/tools/extract_utils.sh
DEVICE=$1
[ -n "$2" ] && SRC=$2 || SRC=adb

if [ ! -f $HELPER ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. $HELPER

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "$0: arguments invalid"
    echo ""
    echo "usage: $0 [DEVICE] [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
fi

# Initialize the helper
setup_vendor $DEVICE $VENDOR $LINEAGE_ROOT

extract $MY_DIR/device-proprietary-files.txt $SRC
extract $MY_DIR/$DEVICE/device-proprietary-files-vendor.txt $SRC

# Don't disable MyVerizonServices app
MVS='<disabled-until-used-preinstalled-carrier-app package="com.verizon.mips.services" />'
sed -i 's|'"$MVS"'|<!--'"$MVS"'-->|' \
    $LINEAGE_ROOT/vendor/$VENDOR/$DEVICE/proprietary/etc/sysconfig/nexus.xml

$MY_DIR/setup-makefiles.sh $DEVICE
