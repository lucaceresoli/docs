all: scratch-gpio.pdf

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

images/%.pdf: images/%.svg
	@printf "%-15s %20s\n" INKSCAPE $(notdir $@)
	inkscape -D -A $@ $<

images/%.pdf: images/%.eps
	@printf "%-15s %s\n" EPSTOPDF $(notdir $@)
	epstopdf --outfile=$@ $^

images/%.eps: images/%.dia
	@printf "%-15s %s\n" DIA $(notdir $@)
	dia -e $@ -t eps $^

scratch-gpio.pdf: \
	images/hydraulic-circuit.pdf \
	images/led-circuit.pdf \
	images/semaphore-manual.pdf \
	images/computer-model.pdf \
	images/semaphore-gpio.pdf \
	images/semaphore-gpio-pir.pdf \

%.pdf: %.tex
	$(XELATEX) $(XELATEX_OPTS) $*

clean:
	rm -fr *.aux *.log *.nav *.out *.pdf *.snm *.tex~ *.toc *~
