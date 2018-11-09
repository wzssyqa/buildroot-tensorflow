###############################################################################
#
# double-conversion
#
################################################################################

DOUBLE_CONVERSION_VERSION = eafa625a34fd5d8bec18eddfccbca55ce77b4849
DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,$(DOUBLE_CONVERSION_VERSION))

DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
DOUBLE_CONVERSION_LICENSE_FILES = LICENSE

DOUBLE_CONVERSION_INSTALL_STAGING = YES

ifeq ($(BR2_SHARED_LIBS),y)
  DOUBLE_CONVERSION_CONF_OPTS += -DBUILD_SHARED=on -DBUILD_STATIC=off
else ifeq ($(BR2_STATIC_LIBS),y)
  DOUBLE_CONVERSION_CONF_OPTS += -DBUILD_SHARED=off -DBUILD_STATIC=on
else
  DOUBLE_CONVERSION_CONF_OPTS += -DBUILD_SHARED=on -DBUILD_STATIC=on
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
