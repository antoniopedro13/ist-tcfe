all: octave_1.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	
<<<<<<< HEAD
octave_1.log: t5.m
=======
octave_1.log: t4.m
>>>>>>> d0b080297fc0b7e965087175cb535c02ef7a19c1
	octave $< > $@
		
clean:
	@rm -f octave-workspace *.cir *.eps *.tex *~ *.log

.PHONY: clean






