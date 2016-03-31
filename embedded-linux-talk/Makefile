all: embedded-linux-talk.pdf

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

images/%.pdf: images/%.eps
	@printf "%-15s %s\n" EPSTOPDF $(notdir $@)
	epstopdf --outfile=$@ $^

images/%.eps: images/%.dia
	@printf "%-15s %s\n" DIA $(notdir $@)
	dia -e $@ -t eps $^

embedded-linux-talk.pdf: \
	images/embedded-systems-range.pdf \
	images/system-architecture.pdf \
	images/system-architecture-kernel.pdf \
	images/system-architecture-libc.pdf \
	images/system-architecture-busybox.pdf \
	images/global-architecture.pdf \
	images/A20-OLinuXino-MICRO.jpeg

%.pdf: %.tex
	$(XELATEX) $(XELATEX_OPTS) $*

clean:
	rm -fr *.aux *.log *.nav *.out *.pdf *.snm *.tex~ *.toc *~
