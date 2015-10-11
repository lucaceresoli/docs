all: un-pinguino-piccolo-piccolo.pdf

XELATEX = xelatex
XELATEX_OPTS = -shell-escape -file-line-error -halt-on-error

%.pdf: %.tex
	$(XELATEX) $(XELATEX_OPTS) $*

clean:
	rm -fr *.aux *.log *.nav *.out *.pdf *.snm *.tex~ *.toc *~
