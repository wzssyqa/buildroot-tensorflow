################################################################################
#
# farmhash
#
################################################################################

FARMHASH_VERSION = 2f0e005b81e296fa6963e395626137cf729b710c
FARMHASH_SITE = $(call github,google,farmhash,$(FARMHASH_VERSION))
FARMHASH_INSTALL_STAGING = YES
FARMHASH_LICENSE = MIT
FARMHASH_LICENSE_FILE = COPYING

$(eval $(autotools-package))
