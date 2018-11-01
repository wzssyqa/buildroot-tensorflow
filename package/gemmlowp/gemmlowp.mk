################################################################################
#
# gemmlowp
#
################################################################################

GEMMLOWP_VERSION = 8416bab644641a5c0a81ecf91a5cda804af0aee1
GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
GEMMLOWP_LICENSE = Apache-2.0
GEMMLOWP_LICENSE_FILES = LICENSE
GEMMLOWP_INSTALL_STAGING = YES
GEMMLOWP_INSTALL_TARGET = NO
GEMMLOWP_DEST_DIR = $(STAGING_DIR)/usr/include/gemmlowp

define GEMMLOWP_BUILD_CMDS
  cd $(@D)/eight_bit_int_gemm; $(TARGET_CXX) -shared -o libeight_bit_int_gemm.so -fPIC eight_bit_int_gemm.cc
endef

# This package only consists of headers that need to be
# copied over to the sysroot for compile time use
define GEMMLOWP_INSTALL_STAGING_CMDS
	$(RM) -r $(GEMMLOWP_DEST_DIR)
	mkdir -p $(GEMMLOWP_DEST_DIR)
	cp -a $(@D)/fixedpoint $(GEMMLOWP_DEST_DIR)
	cp -a $(@D)/internal $(GEMMLOWP_DEST_DIR)
	cp -a $(@D)/profiling $(GEMMLOWP_DEST_DIR)
	cp -a $(@D)/public $(GEMMLOWP_DEST_DIR)
	mkdir -p $(GEMMLOWP_DEST_DIR)/eight_bit_int_gemm
	cp -a $(@D)/eight_bit_int_gemm/*.h $(GEMMLOWP_DEST_DIR)/eight_bit_int_gemm
	cp -a $(@D)/eight_bit_int_gemm/lib*.so $(STAGING_DIR)/usr/lib
endef

$(eval $(generic-package))
