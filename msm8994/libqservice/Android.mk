LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

# b/24171136 many files not compiling with clang/llvm yet
LOCAL_CLANG := false

LOCAL_MODULE                  := libqservice
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(common_includes) $(kernel_includes)
LOCAL_SHARED_LIBRARIES        := $(common_libs) libbinder
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdqservice\"
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
LOCAL_SRC_FILES               := QService.cpp \
                                 IQService.cpp \
                                 IQClient.cpp
LOCAL_COPY_HEADERS_TO         := $(common_header_export_path)
LOCAL_COPY_HEADERS            := IQService.h \
                                 IQClient.h


include $(BUILD_SHARED_LIBRARY)
