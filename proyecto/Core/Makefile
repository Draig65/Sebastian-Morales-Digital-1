TARGET=ws2812_player
TOP=ws2812_player

ICE40_SIM_CELLS=./lattice_sim/cells_sim_ecp5.v

OBJS = ws2812_player.v Reset.v Memoria.v Corr_grb.v Control.v pulso_ws.v cont_bit.v cont_led.v cont_frame.v cont_reset.v
SIM_OBJS =  ../../verilog_model/sky130_fd_sc_hd.v
SIM_OBJS += ../../verilog_model/primitives.v
PER_OBJS = peri_ws2812.v $(OBJS)

BUILD_DIR = build

all: sim

sim:
	rm -f a.out TB/$(TARGET)_TB.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27  TB/$(TARGET)_TB.v $(OBJS)
	vvp a.out
	gtkwave TB/$(TARGET)_TB.vcd
sim_per:
	rm -f a.out TB/peri_ws2812_TB.vcd
	iverilog -DBENCH -I. -I ./lattice_sim TB/peri_ws2812_TB.v $(PER_OBJS)
	vvp a.out
	gtkwave TB/peri_ws2812_TB.vcd &
$(TOP).json: $(OBJS) frames.hex frames_meta.vh
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
$(TOP).asc: $(TOP).json $(TOP).lpf
#	nextpnr-ecp5 --hx8k --package ct256 --json $(TOP).json --pcf $(TOP).pcf --asc $@  --routed-svg $(TOP)_routed.svg --placed-svg $(TOP)_placed.svg #--pcf-allow-unconstrained
	nextpnr-ecp5 --json $< --lpf $(TOP).lpf --textcfg $@ --25k --package CABGA256 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained --routed-svg $(TOP)_routed.svg --placed-svg $(TOP)_placed.svg

$(TOP).config: $(TOP).json $(TOP).lpf
	nextpnr-ecp5 --json $< --lpf $(TOP).lpf --textcfg $@ --25k --package CABGA256 --speed 6  --timing-allow-fail --seed 1 --lpf-allow-unconstrained

$(TOP).bit: $(TOP).config
	ecppack --bootaddr 0 --compress $< --svf ${TOP}.svf --bit $@

configure_lattice: $(TOP).bit
	sudo openFPGALoader -c ft232RL --pins=TXD:CTS:DTR:RXD -m $(TOP).bit

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
	rm -rf *.out *.vcd TB/*.vcd *.svg *.json $(TOP)_synth.v *.vpp *.asc *.config *.bit *.svf $(TOP)_route.v synth.log
