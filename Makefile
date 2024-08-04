CC=pdflatex
MAIN=main.tex

SOURCES=$(MAIN) page1sidebar.tex altacv.cls

OUTPUT=$(MAIN:.tex=.pdf)

all: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) $(MAIN)
	$(CC) $(MAIN)

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.run.xml *.bcf *.pdf

distclean: clean
	rm -f $(OUTPUT)

.PHONY: all clean distclean
