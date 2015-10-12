all: un-pinguino-piccolo-piccolo.pdf

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

images/%.pdf: images/%.eps
	@printf "%-15s %s\n" EPSTOPDF $(notdir $@)
	epstopdf --outfile=$@ $^

images/%.eps: images/%.dia
	@printf "%-15s %s\n" DIA $(notdir $@)
	dia -e $@ -t eps $^

%.pdf: %.tex
	$(XELATEX) $(XELATEX_OPTS) $*

clean:
	rm -fr *.aux *.log *.nav *.out *.pdf *.snm *.tex~ *.toc *~
