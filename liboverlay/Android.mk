LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := liboverlay
LOCAL_MODULE_PATH             := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS             := optional
LOCAL_VENDOR_MODULE           := true
LOCAL_C_INCLUDES              := $(common_includes)
LOCAL_SHARED_LIBRARIES        := $(common_libs) libqdutils libmemalloc \
                                 libsync libdl
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdoverlay\"
ifeq ($(TARGET_USES_QSEED_SCALAR),true)
    LOCAL_CFLAGS += -DUSES_QSEED_SCALAR
endif
ifeq ($(TARGET_USES_DUAL_DSI_API),true)
    LOCAL_CFLAGS += -DDUAL_DSI
endif
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
LOCAL_HEADER_LIBRARIES        := generated_kernel_headers
LOCAL_SRC_FILES := \
      overlay.cpp \
      overlayUtils.cpp \
      overlayMdp.cpp \
      overlayRotator.cpp \
      overlayMdpRot.cpp \
      overlayMdssRot.cpp \
      overlayWriteback.cpp \
      pipes/overlayGenPipe.cpp

include $(BUILD_SHARED_LIBRARY)
