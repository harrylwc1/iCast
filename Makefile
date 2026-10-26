include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=iCast
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/iCast
  SUBMENU:=DVB Support
  TITLE:=iCast DTMB/DVBC USB DVB driver
  FILES:=$(PKG_BUILD_DIR)/dvb-usb-icast-fe.ko \
         $(PKG_BUILD_DIR)/dvb-usb-icast-smit.ko \
         $(LINUX_DIR)/drivers/usb/core/usbcore.ko \
         $(LINUX_DIR)/drivers/usb/common/usb-common.ko \
         $(LINUX_DIR)/fs/nls/nls_base.ko \
         $(LINUX_DIR)/drivers/media/mc/mc.ko \
         $(LINUX_DIR)/drivers/media/dvb-core/dvb-core.ko \
         $(LINUX_DIR)/drivers/media/usb/dvb-usb/dvb-usb.ko \
         $(LINUX_DIR)/drivers/media/rc/rc-core.ko \
         $(LINUX_DIR)/drivers/input/input-core.ko
  AUTOLOAD:=$(call AutoProbe,dvb-usb-icast-fe dvb-usb-icast-smit)
  DEPENDS:=
endef

define KernelPackage/iCast/description
  iCast DTMB/DVBC USB DVB driver.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		M="$(PKG_BUILD_DIR)" \
		modules
endef

$(eval $(call KernelPackage,iCast))
