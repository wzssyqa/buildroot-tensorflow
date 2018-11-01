################################################################################
#
# fft2d
#
################################################################################

FFT2D_SITE = http://www.kurims.kyoto-u.ac.jp/~ooura
FFT2D_SOURCE = fft2d.tgz
FFT2D_INSTALL_STAGING = YES

define FFT2D_BUILD_CMDS
    cd $(@D); \
    $(TARGET_CC) -shared -o liballoc.so -fPIC alloc.c; \
    $(TARGET_CC) -shared -o libfft4f2d.so -fPIC fft4f2d.c; \
    $(TARGET_CC) -shared -o libfftsg.so -fPIC fftsg.c; \
    $(TARGET_CC) -shared -o libfftsg2d.so -fPIC fftsg2d.c; \
    $(TARGET_CC) -shared -o libfftsg3d.so -fPIC fftsg3d.c; \
    $(TARGET_CC) -shared -o libshrtdct.so -fPIC shrtdct.c
endef

define FFT2D_INSTALL_STAGING_CMDS
    cp -a $(@D)/lib*.so $(STAGING_DIR)/usr/lib
    cp -a $(@D)/*.h $(STAGING_DIR)/usr/include
endef

define FFT2D_INSTALL_TARGET_CMDS
    cp -a $(@D)/lib*.so $(TARGET_DIR)/usr/lib
    cp -a $(@D)/*.h $(TARGET_DIR)/usr/include
endef

$(eval $(generic-package))
