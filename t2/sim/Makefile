all: all_1 all_2 all_3 all_4 all_5 all_6

all_1: ngspice_1.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	
ngspice_1.log: ../sim/Teste_1.net
	ngspice -b $< -o $@
	
all_2: ngspice_2.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	
ngspice_2.log: ../sim/Teste_2.net
	ngspice -b $< -o $@
	
all_3: ngspice_3.log
	$(eval NGSFIGS=$(shell grep _FIG $<  | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	
ngspice_3.log: ../sim/Teste_3.net
	ngspice -b $< -o $@
	
all_4: ngspice_4.log
	$(eval NGSFIGS=$(shell grep _FIG $<  | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	
ngspice_4.log: ../sim/Teste_4.net
	ngspice -b $< -o $@
	
all_5: ngspice_5.log
	$(eval NGSFIGS=$(shell grep _FIG $<  | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)	
ngspice_5.log: ../sim/Teste_5.net
	ngspice -b $< -o $@
	
all_6: octave_2.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	
octave_2.log: script_octave2.m
	octave $< > $@
	
clean:
	@rm -f octave-workspace *.log *.tex *.pdf *.ps *~
	
.PHONY: all clean
