################################################################################
#
# neon2see
#
################################################################################

NEON2SSE_VERSION = 97a126f08ce318023be604d03f88bf0820a9464a
NEON2SSE_SITE = $(call github,intel,arm_neon_2_x86_sse,$(NEON2SSE_VERSION))

NEON2SSE_LICENSE = BSD-2-Clause
NEON2SSE_LICENSE_FILES = LICENSE

NEON2SSE_INSTALL_STAGING = YES

$(eval $(cmake-package))
