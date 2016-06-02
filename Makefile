NAME = main
PDFS = $(NAME).pdf

%.pdf: %.tex
	latexmk -pdf -pdflatex=xelatex -latex=xelatex $< || exit 1

all: Makefile $(PDFS)
	rm -f resume.pdf
	mv main.pdf resume.pdf

short: xelatex $(NAME).tex

.PHONY: all short clean
clean:
	latexmk -C
	rm -f resume.pdf

