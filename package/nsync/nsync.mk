###############################################################################
#
# nsync
#
################################################################################

NSYNC_VERSION = 912045960b78dcbbdbe1bc677c5f8f9940f142cc
NSYNC_SITE = $(call github,google,nsync,$(NSYNC_VERSION))

NSYNC_LICENSE = Apache-2.0
NSYNC_LICENSE_FILES = LICENSE

NSYNC_INSTALL_STAGING = YES

#FIXME: need patch
#ifeq ($(BR2_SHARED_LIBS),y)
#  NSYNC_CONF_OPTS += -DBUILD_SHARED=on -DBUILD_STATIC=off
#else ifeq ($(BR2_STATIC_LIBS),y)
#  NSYNC_CONF_OPTS += -DBUILD_SHARED=off -DBUILD_STATIC=on
#else
#  NSYNC_CONF_OPTS += -DBUILD_SHARED=on -DBUILD_STATIC=on
#endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
