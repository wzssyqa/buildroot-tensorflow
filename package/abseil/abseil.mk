################################################################################
#
# abseil
#
################################################################################

ABSEIL_VERSION = cc8dcd307b76a575d2e3e0958a4fe4c7193c2f68
ABSEIL_SITE = $(call github,abseil,abseil-cpp,$(ABSEIL_VERSION))

ABSEIL_LICENSE = Apache-2.0
ABSEIL_LICENSE_FILES = LICENSE

ABSEIL_INSTALL_STAGING = YES

ABSEIL_CONF_OPTS = -DBUILD_TESTING=OFF

$(eval $(cmake-package))
