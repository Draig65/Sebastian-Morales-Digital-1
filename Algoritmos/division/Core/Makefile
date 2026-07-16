TARGET=div
TOP=div

ICE40_SIM_CELLS=./lattice_sim/cells_sim_ecp5.v

OBJS = div.v Comp_aca.v Control.v Corr_acb.v Corr_r.v cont.v res.v 
SIM_OBJS =  ../../verilog_model/sky130_fd_sc_hd.v
SIM_OBJS += ../../verilog_model/primitives.v
PER_OBJS = peri_divi.v $(OBJS)

BUILD_DIR = build

all: sim

sim:
	rm -f a.out TB/$(TARGET)_TB.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27  TB/$(TARGET)_TB.v $(OBJS)
	vvp a.out
	gtkwave TB/$(TARGET)_TB.vcd 
sim_per:
	rm -f a.out TB/peri_divi_TB.vcd
	iverilog -I ./lattice_sim TB/peri_divi_TB.v $(PER_OBJS)
	vvp a.out
	gtkwave TB/peri_divi_TB.vcd &
$(TOP).json:
	yosys -v3 -l synth.log -p 'synth_ecp5 -top $(TARGET) -json $(TARGET).json; write_verilog -attr2comment $(TARGET)_synth.v' $(OBJS)

## ---------------------
## post-synth simulation
## ---------------------
sim_post_syn: $(TOP).json $(OBJS)
	iverilog -I ./lattice_sim -o $@_PS.vpp -s $(TOP)_TB TB/$(TARGET)_TB.v $(TOP)_synth.v $(ICE40_SIM_CELLS)
	vvp $@_PS.vpp
	gtkwave TB/$(TOP)_TB.vcd &
sim_post_syn_sky:
	yosys -l synth.log -c synth.tcl
	cp out.v $(TOP)_synth_sky.v 
	iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 -o $@_PS.vpp -s $(TOP)_TB TB/$(TARGET)_TB.v $(TOP)_synth_sky.v ${SIM_OBJS}
	vvp $@_PS.vpp
	./$@_PS.vpp
	gtkwave TB/$(TOP)_TB.vcd &
	#netlistsvg ${TARGET}.json -o ${TARGET}.svg  #--skin default.svg
	

## ---------------------
## post-route simulation
## ---------------------
$(TOP).asc: $(TOP).json
#	nextpnr-ecp5 --hx8k --package ct256 --json $(TOP).json --pcf $(TOP).pcf --asc $@  --routed-svg $(TOP)_routed.svg --placed-svg $(TOP)_placed.svg #--pcf-allow-unconstrained
	nextpnr-ecp5 --json $< --lpf $(TOP).lpf --textcfg $@ --25k --package CABGA381 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained --routed-svg $(TOP)_routed.svg --placed-svg $(TOP)_placed.svg

$(TOP).config: $(TOP).json
	nextpnr-ecp5 --json $< --lpf $(TOP).lpf --textcfg $@ --25k --package CABGA381 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained

$(TOP).bit: $(TOP).config
	ecppack --bootaddr 0 --compress $< --svf ${TOP}.svf --bit $@

sim_post_route: $(TOP).asc $(TOP).pcf $(TOP).bit
	ecpunpack $(TOP).bit $(TOP).tcf
#	iverilog -o $@.vpp -s $(TOP)_TB $(TARGET)_post_route_TB.v  $(TOP)_route.v  $(ICE40_SIM_CELLS)
#	chmod -x $@
#	vvp $@.vpp
#	gtkwave $(TOP)_TB.vcd &

svg: $(OBJS)
	yosys -p "prep -top ${TARGET}; write_json ${TARGET}.json" ${OBJS}
	netlistsvg ${TARGET}.json -o ${TARGET}.svg  #--skin default.svg
	yosys -p "prep -top ${TARGET} -flatten; write_json ${TARGET}_flat.json" ${OBJS}
	netlistsvg ${TARGET}_flat.json -o ${TARGET}_flat.svg  #--skin default.svg

clean:
	rm -rf *.out *.vcd TB/*.vcd *.svg *.json $(TOP)_synth.v *.vpp *.asc $(TOP)_route.v synth.log


#https://stackoverflow.com/questions/35927650/is-it-possible-to-create-a-simulation-waveform-from-yosys-output
