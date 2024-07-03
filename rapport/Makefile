

all:
	touch touch.tex
	make main.pdf

clean:
	rm -f *.log *.aux *.log *~ *.toc *.out *.bbl *.blg

realclean: clean
	rm -f *.pdf *.html *.odt


.PRECIOUS: main.tex

ifndef EMACSBIN
EMACSBIN=emacs
endif
EMACS=$(EMACSBIN) --batch --load=emacs-org.el

%.tex: %.org
	$(EMACS) --visit=$*.org   --funcall  org-latex-export-to-latex


noweb:
	$(EMACS) --visit=main.org --funcall  org-babel-tangle


bib:
	bibtex main

docker:
	docker run --user `id -u` \
    -v "$$PWD":/current_dir -w /current_dir \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix  \
	 -i -t jahierwan/verimag-sync-papers



# Expanse les blocs noweb
%.noweb: %.org
	$(EMACS) --visit=$*.org --funcall  org-babel-tangle



SOURCES=bib.bib header.tex main.tex preambule.tex   Makefile
objdir=./objs

figdir=./figs

FIGS=
figures: $(FIGS)

$(objdir)/%.pdf : $(figdir)/%.fig
	cp $(figdir)/$*.fig $(objdir)/$*.fig
	fig2dev -Lpstex $(objdir)/$*.fig > $(objdir)/$*.ps
	cd $(objdir);  epstopdf $*.ps
	cd $(objdir); fig2dev -Lpstex_t  -p $*.pdf $*.fig > $*.tex

zip:  $(SOURCES)
	zip  -c main.zip $(SOURCES)



%.pdf: %.tex header.tex preambule.tex touch.tex  $(FIGS)
	pdflatex --shell-escape  $*.tex
	pdflatex --shell-escape  $*.tex




%.doc: %.odt
	odt2doc $<
