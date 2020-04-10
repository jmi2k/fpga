.POSIX:
.SUFFIXES:

TOP = vga

all: sim synth

sim: hdl/$(TOP).vcd
	gtkwave $<

# TODO
synth: hdl/$(TOP).blif

clean:
	-find . -name '*.blif' -exec $(RM) {} +
	-find . -name '*.out' -exec $(RM) {} +
	-find . -name '*.vcd' -exec $(RM) {} +

.v.blif:
	yosys -p 'synth_ecp5 -blif $*.blif' $<

.v.vcd:
	iverilog -D'VCD="$*.vcd"' -o $*.out $< `echo $< | sed 's|^hdl|test|'`
	./$*.out

.PHONY: all sim synth
.SUFFIXES: .blif .v .vcd