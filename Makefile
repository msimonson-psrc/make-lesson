# first line is all the 'rules' of the Makefile you want to run as a default

analysis.zip: *.dat wordcount.py
	zip $@ $^

.PHONY : dats
dats: isles.dat abyss.dat last.dat

# target: dependencies
#	action (MUST use a tab)
# collectively called rule

# count words
isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@

abyss.dat : books/abyss.txt wordcount.py
	python wordcount.py $< $@

last.dat: books/last.txt wordcount.py
	python wordcount.py $< $@
	
.PHONY : clean
clean : 
	rm -f *.dat analysis.zip

# zip up all dat files
