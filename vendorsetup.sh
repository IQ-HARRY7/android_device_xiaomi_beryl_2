#!/bin/bash

# Copyright (C) 2025-2026 OrangeFox Recovery Project
# Copyright (C) 2026 IQ_HARRY_07
# SPDX-License-Identifier: GPL-3.0-only
# its hard guys 🫩

FDEVICE="beryl"

# Register lunch combo UNCONDITIONALLY — must be outside if block
# add_lunch_combo fox_beryl-ap2a-eng#

fox_get_target_device() {
    local chkdev=""
    if [ -n "$ZSH_VERSION" ]; then
        local current_source="${(%):-%x}"
        chkdev=$(echo "$current_source" | grep -w "$FDEVICE")
    elif [ -n "$BASH_VERSION" ]; then
        chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    fi
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        if [ -n "$BASH_VERSION" ]; then
            chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        elif [ -n "$ZSH_VERSION" ]; then
            chkdev=$(echo "$*" | grep -w "$FDEVICE")
        fi
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

    # Device
    export FOX_BUILD_DEVICE=beryl
    export TARGET_DEVICE_ALT="citrine"
    export FOX_TARGET_DEVICES="beryl,citrine"

    # Binaries & Tools
    export FOX_USE_BUSYBOX_BINARY=1
    export FOX_USE_BASH_SHELL=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_ZSTD_BINARY=1
    export FOX_USE_DATE_BINARY=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1

    # OrangeFox
    export FOX_VENDOR_BOOT_RECOVERY=1
    export FOX_VANILLA_BUILD=1
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_DELETE_AROMAFM=1
    export FOX_DELETE_INITD_ADDON=1
    export FOX_USE_UPDATED_MAGISKBOOT=1

    # KernelSU
    export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
    export FOX_ENABLE_SUKISU_SUPPORT=1

    # A/B Partition
    export FOX_VIRTUAL_AB_DEVICE=1
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    # Build
    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL="C"
    export BUILD_USERNAME=IQ_HARRY_07
    export BUILD_HOSTNAME=github

    # CCACHE
    export USE_CCACHE=1
    export CCACHE_EXEC="/usr/bin/ccache"
    export CCACHE_MAXSIZE="50G"
    export CCACHE_DIR="/mnt/ccache"

    if [ $USE_CCACHE = 1 ] && [ ! -d ${CCACHE_DIR} ]; then
        echo "CCACHE Directory/Partition is not mounted at \"${CCACHE_DIR}\""
        echo "Please edit the CCACHE_DIR build variable or mount the directory."
    fi

else
    if [ -z "$FOX_BUILD_DEVICE" ] && [ -z "$BASH_SOURCE" ] && [ -z "$ZSH_VERSION" ]; then
        echo "I: This script requires bash or zsh. Not processing $FDEVICE"
    fi
fi
