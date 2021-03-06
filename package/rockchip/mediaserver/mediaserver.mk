MEDIASERVER_SITE = $(TOPDIR)/../app/mediaserver
MEDIASERVER_SITE_METHOD = local

MEDIASERVER_DEPENDENCIES = rkmedia dbus dbus-cpp librkdb json-for-modern-cpp minilogger

MEDIASERVER_CONF_OPTS += -DBR2_SDK_PATH=$(HOST_DIR)

ifeq ($(BR2_PACKAGE_RK_OEM), y)
MEDIASERVER_INSTALL_TARGET_OPTS = DESTDIR=$(BR2_PACKAGE_RK_OEM_INSTALL_TARGET_DIR) install/fast
MEDIASERVER_DEPENDENCIES += rk_oem
endif

ifeq ($(BR2_PACKAGE_MEDIASERVE_LINKAPI), y)
    MEDIASERVER_CONF_OPTS += -DENABLE_LINK_SUPPORT=ON
    MEDIASERVER_DEPENDENCIES += cjson
endif

$(eval $(cmake-package))
