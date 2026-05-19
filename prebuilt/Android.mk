LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := kernel_modules
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/lib/modules
LOCAL_SRC_FILES := vendor/lib/modules/1.1/%.ko
# ... list all modules
include $(BUILD_PHONY_PACKAGE)
