LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power.stats@1.0-service.mock-juice
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_STEM := android.hardware.power.stats@1.0-service.mock

LOCAL_SRC_FILES := \
    service.cpp \
    PowerStats.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.power.stats@1.0-service-juice.rc

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    libfmq \
    libhidlbase \
    liblog \
    libutils \
    android.hardware.power.stats@1.0

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power.stats@1.0-service-juice.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := android.hardware.power.stats@1.0-service.rc

LOCAL_SRC_FILES := android.hardware.power.stats@1.0-service-juice.rc

include $(BUILD_PREBUILT)
