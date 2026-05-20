# ITS HARD GUYS🥲
#
# Copyright (C) 2025-2026 OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-only
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),beryl)

include $(CLEAR_VARS)
LOCAL_MODULE := beryl_kernel_modules
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/lib/modules

# Copy all .ko files from prebuilt/modules/ to recovery
KERNEL_MODULES := $(wildcard $(LOCAL_PATH)/modules/*.ko)
LOCAL_SRC_FILES := $(KERNEL_MODULES)

$(foreach module,$(KERNEL_MODULES),$(eval $(call copy-one-file,$(module),$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/$(notdir $(module)))))

# Copy modules metadata files
$(call copy-one-file,$(LOCAL_PATH)/modules/modules.alias,$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/modules.alias)
$(call copy-one-file,$(LOCAL_PATH)/modules/modules.dep,$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/modules.dep)
$(call copy-one-file,$(LOCAL_PATH)/modules/modules.load,$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/modules.load)
$(call copy-one-file,$(LOCAL_PATH)/modules/modules.load.recovery,$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/modules.load.recovery)
$(call copy-one-file,$(LOCAL_PATH)/modules/modules.softdep,$(TARGET_RECOVERY_ROOT_OUT)/lib/modules/modules.softdep)

include $(BUILD_PHONY_PACKAGE)

endif
