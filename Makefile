LATEX=latex
BIBTEX=bibtex
DVIPS=dvips
DVIPDF=dvipdf
DVIPDF=dvipdfm
PDFLATEX=pdflatex

#FIG-FILES = figs/*.png img/*.tex
TEX-FILES = *.tex
BIB-FILES = *.bib
TOP-LEVEL-ROOT = rt-nsf-2016


all: ${TOP-LEVEL-ROOT}.pdf 

${TOP-LEVEL-ROOT}.pdf: ${PDF-FILES} ${TEX-FILES} ${BIB-FILES} ${FIG-FILES}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(BIBTEX) ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}

web: all
	cp $(TOP-LEVEL-ROOT).pdf ~/html/oopsla.pdf

dropbox: all 
	cp $(TOP-LEVEL-ROOT).pdf ~/Dropbox/oopsla2013\ paper/$(CRNAME)

clean:
	rm -f *.auxlock *-blx.bib *.run.xml *.aux *.bbl *.blg *.log *.dvi *.out *.idx *.bak *~ *.toc *.lof
	rm -f out/*
	rm -f *.pdf
