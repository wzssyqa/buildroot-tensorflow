################################################################################
#
# tensorflow-lite
#
################################################################################

TENSORFLOW_LITE_VERSION = 4b46a399d7a5a5c9cc262d08e0df1217364a5b9f
TENSORFLOW_LITE_SITE = $(call github,tensorflow,tensorflow,$(TENSORFLOW_LITE_VERSION))
TENSORFLOW_LITE_SUBDIR = tensorflow/lite

TENSORFLOW_LITE_LICENSE = Apache-2.0
TENSORFLOW_LITE_LICENSE_FILES = LICENSE

TENSORFLOW_LITE_INSTALL_STAGING = YES

TENSORFLOW_LITE_CONF_OPTS += -DCROSS_SYSROOT=$(STAGING_DIR)
ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_MICRO),y)
  TENSORFLOW_LITE_CONF_OPTS += -DBUILD_TYPE=micro
else ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_TESTING),y)
  TENSORFLOW_LITE_CONF_OPTS += -DENABLE_TESTING=on
endif

$(eval $(cmake-package))
