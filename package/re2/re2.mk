################################################################################
#
# re2
#
################################################################################

RE2_VERSION = 2206f4f59a3862e5220712e1c4dcbd8b45f70861
RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
RE2_LICENSE = BSD-3-Clause
RE2_LICENSE_FILES = LICENSE

RE2_INSTALL_STAGING = YES

ifeq ($(BR2_STATIC_LIBS),y)
RE2_MAKE_TARGET = obj/libre2.a
RE2_MAKE_INSTALL_TARGET = install-static
else ifeq ($(BR2_SHARED_LIBS),y)
RE2_MAKE_TARGET = obj/so/libre2.so
RE2_MAKE_INSTALL_TARGET = install-shared
else
RE2_MAKE_TARGET = obj/libre2.a obj/so/libre2.so
RE2_MAKE_INSTALL_TARGET = install
endif

define RE2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RE2_MAKE_TARGET)
endef

define RE2_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(STAGING_DIR) prefix=/usr $(RE2_MAKE_INSTALL_TARGET)
endef

define RE2_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(TARGET_DIR) prefix=/usr $(RE2_MAKE_INSTALL_TARGET)
endef

$(eval $(generic-package))
