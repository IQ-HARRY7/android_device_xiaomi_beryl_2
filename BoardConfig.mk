#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/beryl

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \
    odm_dlkm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor
      
BOARD_RAMDISK_USE_LZ4 := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Display
TARGET_SCREEN_DENSITY := 450

#Things that Orangefox developer told me to add🙌
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# Allow for building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_USES_NETWORK := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Disable hashtree + verification
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# VA/B with recovery partition. Leave this blank as Google recommends
# BOARD_USES_RECOVERY_AS_BOOT :=

# Generic system/kernel image
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# Kernel / Recovery image
TARGET_PREBUILT_KERNEL        := $(DEVICE_PATH)/prebuilt/kernel
TARGET_KERNEL_ARCH            := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH     := $(TARGET_ARCH)

# offsets, et al
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_HEADER_SIZE := 2128
BOARD_DTB_SIZE := 266395

BOARD_KERNEL_PAGESIZE         := 4096
BOARD_KERNEL_IMAGE_NAME       := kernel
BOARD_BOOT_HEADER_VERSION     := 4
BOARD_MKBOOTIMG_ARGS          += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS          += --pagesize $(BOARD_KERNEL_PAGESIZE)

# bootconfig
BOARD_BOOTCONFIG += kernel.rcu_nocbs=all kernel.rcutree.enable_rcu_lazy=1 kernel.rcupdate.rcu_cpu_stall_cputime=1

# cmdline
VENDOR_CMDLINE := bootopt=64S3,32N2,64N2 bootconfig loop.max_part=7
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(VENDOR_CMDLINE)"

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144

# necessary imgs & their size
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

# file system & out
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# super .img partition & mangement.
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \
    odm_dlkm

BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Platform
TARGET_BOARD_PLATFORM := mt6855

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true

# Verified Boot
BOARD_AVB_ENABLE := true

# set SELinux to permissive mode
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# add dtb to vendor_boot.img
BOARD_MKBOOTIMG_ARGS += --dtb $(BOARD_PREBUILT_DTBIMAGE)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# i dont know what is this
BOARD_USES_METADATA_PARTITION := true

# make the decryption work & add mtk hardware logic
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# MTK specific
BOARD_USES_MTK_HARDWARE := true

# F2FS support
TARGET_USERIMAGES_USE_F2FS := true
# ___________

# Filesystem
TARGET_USES_MKE2FS            := true

#Gemini
BOARD_PREBUILT_DTBIMAGE := device/xiaomi/beryl/prebuilt/dtb

# This device does not support fastboot boot, do *NOT* remove!
# TW_NO_FASTBOOT_BOOT := true 
# temporary comment out

# Recovery
TARGET_SYSTEM_PROP := \
    $(DEVICE_PATH)/system.prop

TARGET_RECOVERY_FSTAB := \
    $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

TARGET_BOARD_INFO_FILE := \
    $(DEVICE_PATH)/board-info.txt

# Debugging
TARGET_USES_LOGD               := true
#TARGET_RECOVERY_DEVICE_MODULES += strace
#RECOVERY_BINARY_SOURCE_FILES   += $(TARGET_OUT_EXECUTABLES)/strace
