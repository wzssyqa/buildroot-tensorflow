################################################################################
#
# eigen
#
################################################################################

EIGEN_VERSION = 115d7c7dfe67000660646f20fb74f8c65e05c539
EIGEN_SITE = $(call github,eigenteam,eigen-git-mirror,$(EIGEN_VERSION))
EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
EIGEN_INSTALL_STAGING = YES
EIGEN_INSTALL_TARGET = NO
EIGEN_DEST_DIR = $(STAGING_DIR)/usr/include/eigen3
HOST_EIGEN_DEST_DIR = $(HOST_DIR)/usr/include/eigen3

ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
	mkdir -p $(EIGEN_DEST_DIR)/unsupported
	cp -a $(@D)/unsupported/Eigen $(EIGEN_DEST_DIR)/unsupported
endef
endif
define HOST_EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
	mkdir -p $(HOST_EIGEN_DEST_DIR)/unsupported
	cp -a $(@D)/unsupported/Eigen $(HOST_EIGEN_DEST_DIR)/unsupported
endef

# Generate the .pc file at build time
define EIGEN_BUILD_CMDS
	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}/include/eigen3,' \
		-e 's,^prefix.*,prefix=/usr,' \
		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
endef
define HOST_EIGEN_BUILD_CMDS
	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}/include/eigen3,' \
		-e 's,^prefix.*,prefix=/usr,' \
		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
endef

# This package only consists of headers that need to be
# copied over to the sysroot for compile time use
define EIGEN_INSTALL_STAGING_CMDS
	$(RM) -r $(EIGEN_DEST_DIR)
	mkdir -p $(EIGEN_DEST_DIR)
	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
endef
define HOST_EIGEN_INSTALL_CMDS
	$(RM) -r $(HOST_EIGEN_DEST_DIR)
	mkdir -p $(HOST_EIGEN_DEST_DIR)
	cp -a $(@D)/Eigen $(HOST_EIGEN_DEST_DIR)
	$(HOST_EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
		$(HOST_DIR)/usr/lib/pkgconfig/eigen3.pc
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
