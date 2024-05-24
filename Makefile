# Makefile for LaTeX projects

# Compiler
CC=pdflatex

# Main document
MAIN=main.tex

# All TeX sources
SOURCES=$(MAIN) page1sidebar.tex altacv.cls

# PDF Output
OUTPUT=$(MAIN:.tex=.pdf)

# Compile the main document
all: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) $(MAIN)
	$(CC) $(MAIN) # Run twice for proper references

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.run.xml *.bcf

# Clean all files, including PDFs
distclean: clean
	rm -f $(OUTPUT)

# Rule for watching file changes (requires inotify-tools on Linux)
watch:
	while inotifywait -e close_write $(SOURCES); do make; done

.PHONY: all clean distclean watch

