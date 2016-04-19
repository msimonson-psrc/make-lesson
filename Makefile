# first line is all the 'rules' of the Makefile you want to run as a default

COUNT_SCRIPT = wordcount.py
#PLOT_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))


analysis.zip: $(DAT_FILES) $(COUNT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats: $(DAT_FILES)

.PHONY : variables
variables: 
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)

# target: dependencies
#	action (MUST use a tab)
# collectively called rule

# count words
%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat
	
.PHONY : clean
clean : 
	rm -f $(DAT_FILES) 
	rm -f analysis.zip

