ifeq ("$(origin V)", "command line")
  Q =
else
  Q = @
endif

all:
.PHONY: all

%.pdf: %.svg
	@printf "%-12s %-20s\n" INKSCAPE $(notdir $@)
	${Q}inkscape -D -A $@ $<

%.pdf: %.dot
	@printf "%-12s %-20s\n" DOT $(notdir $@)
	${Q}dot -Tpdf $< >$@

%.pdf: %.eps
	@printf "%-12s %s\n" EPSTOPDF $(notdir $@)
	${Q}epstopdf --outfile=$@ $^

%.eps: %.dia
	@printf "%-12s %s\n" DIA $(notdir $@)
	${Q}( cd $(dir $^) ; dia -e $(notdir $@) -t eps $(notdir $^) )

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

%.pdf: %.tex
	@printf "%-12s %s\n" XELATEX $(notdir $@)
	${Q}(   cd $(dir $(*)); \
		LOGFILE="$(basename $(notdir $<)).stdout" ; \
		$(XELATEX) $(XELATEX_OPTS) $(notdir $<) >$$LOGFILE || \
		(cat $$LOGFILE ; false) )

embedded-linux-talk/embedded-linux-talk.pdf: \
	embedded-linux-talk/images/embedded-systems-range.pdf \
	embedded-linux-talk/images/system-architecture.pdf \
	embedded-linux-talk/images/system-architecture-kernel.pdf \
	embedded-linux-talk/images/system-architecture-libc.pdf \
	embedded-linux-talk/images/system-architecture-busybox.pdf \
	embedded-linux-talk/images/global-architecture.pdf \
	embedded-linux-talk/images/A20-OLinuXino-MICRO.jpeg

scratch-gpio/scratch-gpio.pdf: \
	scratch-gpio/images/hydraulic-circuit.pdf \
	scratch-gpio/images/led-circuit.pdf \
	scratch-gpio/images/semaphore-manual.pdf \
	scratch-gpio/images/computer-model.pdf \
	scratch-gpio/images/semaphore-gpio.pdf \
	scratch-gpio/images/semaphore-gpio-pir.pdf \

text-processing-cmdline/text-processing-cmdline.pdf: \
	text-processing-cmdline/images/process.pdf \
	text-processing-cmdline/images/pipeline.pdf \
	text-processing-cmdline/images/sed1.pdf \
	text-processing-cmdline/images/sed2.pdf \
	text-processing-cmdline/images/awk-flow.pdf \
	text-processing-cmdline/images/awk-script.pdf \

oop-c-kernel/oop-c-kernel.pdf: \
	oop-c-kernel/images/inheritance.pdf \
	oop-c-kernel/images/device-model.pdf

terrible-bsp/terrible-bsp.pdf: \
	terrible-bsp/images/booting.pdf \
	terrible-bsp/images/booting-on-fat.pdf \
	terrible-bsp/images/booting-fat-ubi.pdf \
	terrible-bsp/images/booting-no-nvt-loader.pdf \
	terrible-bsp/images/flashing-tool.pdf \
	terrible-bsp/images/pseudo-partition-table.pdf \
	terrible-bsp/images/ram-on-package.pdf \
	terrible-bsp/images/windows_10_compatible.pdf \
	terrible-bsp/images/linux-mainline.pdf

make-autotools-cmake/make-autotools-cmake.pdf: \
	make-autotools-cmake/images/c-example.pdf \
	make-autotools-cmake/images/shell.pdf \
	make-autotools-cmake/images/depend-graph.pdf \
	make-autotools-cmake/images/makefile.pdf \
	make-autotools-cmake/images/autotools.pdf \
	make-autotools-cmake/images/autotools-autoconf.pdf \
	make-autotools-cmake/images/autotools-config-files.pdf \
	make-autotools-cmake/images/autotools-automake.pdf \
	make-autotools-cmake/images/cmake.pdf \

zynqmp-linux/zynqmp-linux.pdf: \
	zynqmp-linux/images/block-diagram.pdf \
	zynqmp-linux/images/pm-layers.pdf \
	zynqmp-linux/images/boot-sequence-fsbl.pdf \
	zynqmp-linux/images/boot-sequence-spl.pdf \
	zynqmp-linux/images/build-xilinx.pdf \
	zynqmp-linux/images/build-community.pdf \
	zynqmp-linux/images/block-diagram-vcu.pdf \
	zynqmp-linux/images/vcu-stack.pdf \

buildroot-yocto-daily/buildroot-yocto-daily.pdf: \
	buildroot-yocto-daily/images/dependencies.pdf \
	buildroot-yocto-daily/images/br-tools.pdf \
	buildroot-yocto-daily/images/yocto-tools.pdf \
	buildroot-yocto-daily/images/br-flow.pdf \
	buildroot-yocto-daily/images/yocto-flow.pdf \
	buildroot-yocto-daily/images/dependencies2.pdf \
	buildroot-yocto-daily/images/br-steps.pdf \
	buildroot-yocto-daily/images/yocto-tasks.pdf \
	buildroot-yocto-daily/images/br-avahi-graph-depends.pdf \
	buildroot-yocto-daily/images/br-graph-depends.pdf \
	buildroot-yocto-daily/images/yocto-taskexp.png \
	buildroot-yocto-daily/images/out-dirs-build.pdf \
	buildroot-yocto-daily/images/out-dirs-rootfs.pdf \
	buildroot-yocto-daily/images/out-dirs-images.pdf \
	buildroot-yocto-daily/images/recipe-dirs-layout.pdf \

buildroot-intro/buildroot-intro.pdf: \
	buildroot-intro/images/embedded-systems-range.pdf \
	buildroot-intro/images/operating-system.pdf \
	buildroot-intro/images/host-target.pdf \
	buildroot-intro/images/in-br-out.pdf \
	buildroot-intro/images/br-tools.pdf \
	buildroot-intro/images/br-tools-kconfig.pdf \
	buildroot-intro/images/br-tools-make.pdf \
	buildroot-intro/images/dependencies2.pdf \
	buildroot-intro/images/Beaglebone_Black.jpg \

video-serdes-linux/video-serdes-linux.pdf: \
	video-serdes-linux/images/sensor-soc.pdf \
	video-serdes-linux/images/sensor-ser-des-soc.pdf \
	video-serdes-linux/images/ti-2-cameras.pdf \
	video-serdes-linux/images/v4l2-ideal-pipe.pdf \
	video-serdes-linux/images/i2c-ideal.pdf \
	video-serdes-linux/images/i2c-real.pdf \
	video-serdes-linux/images/gpio-routing.pdf \
	video-serdes-linux/images/gpio-real.pdf \

all: \
	embedded-linux-talk/embedded-linux-talk.pdf \
	scratch-gpio/scratch-gpio.pdf \
	text-processing-cmdline/text-processing-cmdline.pdf \
	oop-c-kernel/oop-c-kernel.pdf \
	terrible-bsp/terrible-bsp.pdf \
	make-autotools-cmake/make-autotools-cmake.pdf \
	zynqmp-linux/zynqmp-linux.pdf \
	buildroot-yocto-daily/buildroot-yocto-daily.pdf \
	buildroot-intro/buildroot-intro.pdf \
	video-serdes-linux/video-serdes-linux.pdf \
