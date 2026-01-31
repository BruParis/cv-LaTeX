# CV Build Makefile
# Builds French/English and Short/Long variants

VARIANTS = cv cv-fr-short cv-en-long cv-en-short
PDFS = $(addprefix build/,$(addsuffix .pdf,$(VARIANTS)))

# Default: build French long version
all: build/cv.pdf

# Build all variants
all-variants: $(PDFS)

# Individual variant targets
fr: build/cv.pdf
fr-long: build/cv.pdf
fr-short: build/cv-fr-short.pdf
en: build/cv-en-long.pdf
en-long: build/cv-en-long.pdf
en-short: build/cv-en-short.pdf

# Generic build rule
build/%.pdf: %.tex cv-content.tex cv.cls sections/fr/*.tex sections/en/*.tex
	latexmk $<

# Clean build artifacts
clean:
	latexmk -c cv.tex cv-fr-short.tex cv-en-long.tex cv-en-short.tex

# Watch mode (default French long)
watch:
	latexmk -pvc cv.tex

watch-fr-short:
	latexmk -pvc cv-fr-short.tex

watch-en-long:
	latexmk -pvc cv-en-long.tex

watch-en-short:
	latexmk -pvc cv-en-short.tex

.PHONY: all all-variants fr fr-long fr-short en en-long en-short clean watch watch-fr-short watch-en-long watch-en-short
