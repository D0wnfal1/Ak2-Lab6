ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m := hello2.o
ccflags-y += -g
else
# normal makefile
KDIR ?= /home/d0wnfal1/repos/linux-stable
default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp hello2.ko hello2.ko.unstripped
	$(CROSS_COMPILE)strip -g hello2.ko # strip only debugging info
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
%.s %.i: %.c # just use make hello2.s instead of objdump
	$(MAKE) -C $(KDIR) M=$$PWD $@
endif
