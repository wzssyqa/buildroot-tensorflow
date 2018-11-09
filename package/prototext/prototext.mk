################################################################################
#
# tensorflow-lite
#
################################################################################

PROTOTEXT_VERSION = 4b46a399d7a5a5c9cc262d08e0df1217364a5b9f
PROTOTEXT_SITE = $(call github,tensorflow,tensorflow,$(PROTOTEXT_VERSION))
PROTOTEXT_DEPENDENCIES = host-protobuf
HOST_PROTOTEXT_DEPENDENCIES = host-protobuf host-abseil host-eigen host-zlib host-double-conversion host-nsync

PROTOTEXT_LICENSE = Apache-2.0
PROTOTEXT_LICENSE_FILES = LICENSE

PROTOTEXT_INSTALL_STAGING = YES

PROTOTEXT_CONF_OPTS += -DTSLITE_TESTING=off -DTSLITE_TYPE=off -DBUILD_TOOLS=on -DSYSROOT=${STAGING_DIR}
HOST_PROTOTEXT_CONF_OPTS += -DTSLITE_TESTING=off -DTSLITE_TYPE=off -DBUILD_TOOLS=on -DSYSROOT=$(HOST_DIR)

$(eval $(cmake-package))
$(eval $(host-cmake-package))
