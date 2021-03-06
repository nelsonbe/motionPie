################################################################################
#
# motion-mmal
#
################################################################################

MOTION_MMAL_SITE = $(call github,dozencrows,motion,$(MOTION_MMAL_VERSION))
MOTION_SITE = http://www.lavrsen.dk/svn/motion/trunk/
MOTION_MMAL_VERSION = c37101be

define MOTION_MMAL_BUILD_CMDS
    cd $(@D); \
    USERLANDPATH="$$(ls -d $(BUILD_DIR)/rpi-userland-*)" TOOLPREFIX="arm-linux-" TOOLPATH="$(HOST_DIR)/usr" ROOTFSPATH="$(STAGING_DIR)" cmake .; \
    make
endef

define MOTION_MMAL_INSTALL_TARGET_CMDS
    cp $(@D)/motion $(TARGET_DIR)/usr/bin/motion-mmal
endef

$(eval $(generic-package))
