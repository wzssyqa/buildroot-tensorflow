################################################################################
#
# tensorflow-lite
#
################################################################################

TENSORFLOW_LITE_VERSION = 4b46a399d7a5a5c9cc262d08e0df1217364a5b9f
TENSORFLOW_LITE_SITE = $(call github,tensorflow,tensorflow,$(TENSORFLOW_LITE_VERSION))
TENSORFLOW_LITE_DEPENDENCIES = host-protobuf host-prototext \
			       protobuf abseil flatbuffers eigen farmhash fft2d gtest \
			       double-conversion re2 sqlite giflib snappy jpeg-turbo \
			       libpng nsync grpc gemmlowp

TENSORFLOW_LITE_LICENSE = Apache-2.0
TENSORFLOW_LITE_LICENSE_FILES = LICENSE

TENSORFLOW_LITE_INSTALL_STAGING = YES

TENSORFLOW_LITE_CONF_OPTS += -DSYSROOT=$(STAGING_DIR)
ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_MICRO),y)
  TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_TYPE=micro
else ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_TESTING),y)
  TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_TESTING=on -DTFLITE_TYPE=full
else
  TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_TESTING=off -DTFLITE_TYPE=full
endif

$(eval $(cmake-package))
