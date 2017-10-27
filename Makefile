all:
.PHONY: all

%.pdf: %.svg
	@printf "%-15s %20s\n" INKSCAPE $(notdir $@)
	inkscape -D -A $@ $<

%.pdf: %.eps
	@printf "%-15s %s\n" EPSTOPDF $(notdir $@)
	epstopdf --outfile=$@ $^

%.eps: %.dia
	@printf "%-15s %s\n" DIA $(notdir $@)
	dia -e $@ -t eps $^

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

%.pdf: %.tex
	( cd $(dir $(*)); $(XELATEX) $(XELATEX_OPTS) $(notdir $<) )

mtheme/beamerthememetropolis.sty:
	make -C mtheme sty

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

text-processing-cmdline/beamerthememetropolis.sty: mtheme/beamerthememetropolis.sty
	cp mtheme/*.sty text-processing-cmdline/

text-processing-cmdline/text-processing-cmdline.pdf: \
	text-processing-cmdline/beamerthememetropolis.sty \
	text-processing-cmdline/images/process.pdf \
	text-processing-cmdline/images/pipeline.pdf \
	text-processing-cmdline/images/sed1.pdf \
	text-processing-cmdline/images/sed2.pdf \
	text-processing-cmdline/images/awk-flow.pdf \
	text-processing-cmdline/images/awk-script.pdf \

oop-c-kernel/oop-c-kernel.pdf: \
	oop-c-kernel/images/inheritance.pdf \
	oop-c-kernel/images/device-model.pdf

terrible-bsp/beamerthememetropolis.sty: mtheme/beamerthememetropolis.sty
	cp mtheme/*.sty terrible-bsp/

terrible-bsp/terrible-bsp.pdf: \
	terrible-bsp/beamerthememetropolis.sty \
	terrible-bsp/images/booting.pdf \
	terrible-bsp/images/booting-on-fat.pdf \
	terrible-bsp/images/booting-fat-ubi.pdf \
	terrible-bsp/images/booting-no-nvt-loader.pdf \
	terrible-bsp/images/flashing-tool.pdf \
	terrible-bsp/images/pseudo-partition-table.pdf \
	terrible-bsp/images/ram-on-package.pdf \
	terrible-bsp/images/windows_10_compatible.pdf \
	terrible-bsp/images/linux-mainline.pdf

make-autotools-cmake/beamerthememetropolis.sty: mtheme/beamerthememetropolis.sty
	cp mtheme/*.sty terrible-bsp/

make-autotools-cmake/make-autotools-cmake.pdf: \
	make-autotools-cmake/beamerthememetropolis.sty \
	make-autotools-cmake/images/c-example.pdf \
	make-autotools-cmake/images/shell.pdf \
	make-autotools-cmake/images/depend-graph.pdf \

all: \
	embedded-linux-talk/embedded-linux-talk.pdf \
	scratch-gpio/scratch-gpio.pdf \
	text-processing-cmdline/text-processing-cmdline.pdf \
	oop-c-kernel/oop-c-kernel.pdf \
	terrible-bsp/terrible-bsp.pdf \
	make-autotools-cmake/make-autotools-cmake.pdf \
