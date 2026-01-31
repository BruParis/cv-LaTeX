all: build/cv.pdf

build/cv.pdf: cv.tex cv.cls sections/*.tex
	latexmk cv.tex

clean:
	latexmk -c

watch:
	latexmk -pvc cv.tex

.PHONY: all clean watch
