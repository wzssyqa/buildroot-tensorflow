###############################################################################
#
# grpc
#
################################################################################

GRPC_VERSION = 35e1f9fa6a318dac3fe232d99a5a41768f12197f
GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
GRPC_DEPENDENCIES = host-protobuf protobuf openssl zlib gflags c-ares

GRPC_LICENSE = Apache-2.0
GRPC_LICENSE_FILES = LICENSE

GRPC_INSTALL_STAGING = YES

define GRPC_BUILD_CMDS
  mkdir -p $(@D)/third_party/protobuf/
  ln -sf ${STAGING_DIR}/usr/include $(@D)/third_party/protobuf/src
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) shared static prefix=/usr \
	  CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) LDXX=$(TARGET_CXX) STRIP="$(TARGET_CROSS)strip --strip-unneeded" AR="$(TARGET_CROSS)ar rcs" RANLIB=$(TARGET_CROSS)ranlib \
	  HOST_CC=gcc HOST_CXX=g++ HOST_LD=gcc HOST_LDXX=g++ HOST_STRIP="strip --strip-unneeded" HOST_AR="ar rcs" HOST_RANLIB="ranlib" \
	  HOST_DIR=$(HOST_DIR) V=1
endef

define GRPC_INSTALL_TARGET_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_LIBDIR=/usr/lib/ \
	  CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) LDXX=$(TARGET_CXX) STRIP="$(TARGET_CROSS)strip --strip-unneeded" AR="$(TARGET_CROSS)ar rcs" RANLIB=$(TARGET_CROSS)ranlib \
	  HOST_CC=gcc HOST_CXX=g++ HOST_LD=gcc HOST_LDXX=g++ HOST_STRIP="strip --strip-unneeded" HOST_AR="ar rcs" HOST_RANLIB="ranlib" \
		install_c install_cxx prefix=$(TARGET_DIR)/usr V=1
endef

define GRPC_INSTALL_STAGING_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_LIBDIR=/usr/lib/ \
	  CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) LDXX=$(TARGET_CXX) STRIP="$(TARGET_CROSS)strip --strip-unneeded" AR="$(TARGET_CROSS)ar rcs" RANLIB=$(TARGET_CROSS)ranlib \
	  HOST_CC=gcc HOST_CXX=g++ HOST_LD=gcc HOST_LDXX=g++ HOST_STRIP="strip --strip-unneeded" HOST_AR="ar rcs" HOST_RANLIB="ranlib" \
		install_c install_cxx prefix=$(STAGING_DIR)/usr V=1
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
