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
	text-processing-cmdline/images/pipeline.pdf

oop-c-kernel/oop-c-kernel.pdf: \
	oop-c-kernel/images/inheritance.pdf \
	oop-c-kernel/images/device-model.pdf

all: \
	embedded-linux-talk/embedded-linux-talk.pdf \
	scratch-gpio/scratch-gpio.pdf \
	text-processing-cmdline/text-processing-cmdline.pdf \
	oop-c-kernel/oop-c-kernel.pdf \
