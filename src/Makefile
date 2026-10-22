obj-m += dvb-usb-icast-fe.o
obj-m += dvb-usb-icast-smit.o

dvb-usb-icast-fe-objs := smit.o icast-fe.o
dvb-usb-icast-smit-objs := smit.o icast-smit.o

ccflags-y += -D CONFIG_DVB_NET
ccflags-y += -I$(src)
ccflags-y += -I$(srctree)/drivers/media/usb/dvb-usb
ccflags-y += -I$(srctree)/drivers/media/dvb-core
ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
ccflags-y += -Wframe-larger-than=4096
