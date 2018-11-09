################################################################################
#
# protobuf
#
################################################################################

# When bumping this package, make sure to also verify if the
# python-protobuf package still works, as they share the same
# version/site variables.
PROTOBUF_VERSION = eecccdc8028e65dad16e59523580d3f17cd9dad6
PROTOBUF_SITE = $(call github,protocolbuffers,protobuf,$(PROTOBUF_VERSION))
PROTOBUF_LICENSE = BSD-3-Clause
PROTOBUF_LICENSE_FILES = LICENSE

# N.B. Need to use host protoc during cross compilation.
PROTOBUF_DEPENDENCIES = host-protobuf host-m4
PROTOBUF_AUTORECONF = YES
PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
PROTOBUF_CONF_ENV += LIBS=-latomic
endif

PROTOBUF_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_ZLIB),y)
PROTOBUF_DEPENDENCIES += zlib
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
