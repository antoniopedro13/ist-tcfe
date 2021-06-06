all: 1 2 

1:ngspice-1.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	ps2pdf vo1f.ps vo1f.pdf
	ps2pdf vo2f.ps vo2f.pdf
	
	
<<<<<<< HEAD
ngspice-1.log: ../sim/t5.net
=======
ngspice-1.log: ../sim/t4.net
>>>>>>> d0b080297fc0b7e965087175cb535c02ef7a19c1
	ngspice -b $< -o $@
		
		
		
		
2:ngspice-2.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	
	
		
<<<<<<< HEAD
ngspice-2.log: ../sim/t5_o.net
=======
ngspice-2.log: ../sim/t4_o.net
>>>>>>> d0b080297fc0b7e965087175cb535c02ef7a19c1
	ngspice -b $< -o $@	
		
					
clean:
	@rm -f *.log *.tex *.pdf *.ps *~

.PHONY: all clean
