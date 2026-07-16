TARGET=bin_to_bcd
TOP=bin_to_bcd
ICE40_SIM_CELLS=./lattice_sim/cells_sim_ecp5.v
OBJS = bin_to_bcd.v comp_bcd.v lsr_bcd.v counter_bcd.v control_bcd.v
SIM_OBJS =  ../../verilog_model/sky130_fd_sc_hd.v
SIM_OBJS += ../../verilog_model/primitives.v
PER_OBJS = peripheral_bin_to_bcd.v $(OBJS)


BUILD_DIR = build

all: sim

sim:
	rm -f a.out TB/$(TARGET)_TB.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=27 -DCPU_FREQ=27  TB/$(TARGET)_TB.v $(OBJS)
	vvp a.out
	gtkwave TB/$(TARGET)_TB.vcd
sim_per:
	rm -f a.out TB/peripheral_bin_to_bcd_TB.vcd
	iverilog -I ./lattice_sim TB/peripheral_bin_to_bcd_TB.v $(PER_OBJS)
	vvp a.out
	gtkwave TB/peripheral_bin_to_bcd_TB.vcd &
$(TOP).json:
	yosys -v3 -l synth.log -p 'synth_ecp5 -top $(TARGET) -json $(TARGET).json; write_verilog -attr2comment $(TARGET)_synth.v' $(OBJS)

## ---------------------
## post-synth simulation
## ---------------------
sim_post_syn: $(TOP).json $(OBJS)
	rm -f $@.vpp $@.vcd
	iverilog -v -o $@.vpp -DPOST_SYNTH -DNO_ICE40_DEFAULT_ASSIGNMENTS $(ICE40_SIM_CELLS) $(SIM_OBJS) $(TARGET)_synth.v TB/$(TOP)_TB.v
	vvp $@.vpp
	gtkwave TB/$(TOP)_TB.vcd &

## ---------------------
## post-synth simulation perip
## ---------------------
$(TOP)_perip.json:
	yosys -v3 -l synth.log -p 'synth_ecp5 -top peripheral_bin_to_bcd -json $(TOP)_perip.json; write_verilog -attr2comment $(TARGET)_perip_synth.v' $(PER_OBJS)
	
sim_post_syn_perip: $(TOP)_perip.json
	rm -f $@_PS.vpp $@_PS.vcd
	iverilog -v -o $@_PS.vpp -DPOST_SYNTH -DNO_ICE40_DEFAULT_ASSIGNMENTS $(ICE40_SIM_CELLS) $(SIM_OBJS) $(TARGET)_perip_synth.v TB/peripheral_bin_to_bcd_TB.v
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
#	iverilog -o $@.vpp -s $(TOP)_TB $(TOP).v $(ICE40_SIM_CELLS) $(SIM_OBJS) TB/$(TOP)_TB.v
#	vvp $@.vpp
#	gtkwave $(TOP)_TB.vcd &
	

view_plased:
	xdot $(TOP)_placed.svg

view_routed:
	xdot $(TOP)_routed.svg
prog:
	openocd -f /usr/share/trellis/misc/openocd/ecp5-evn.cfg -c "transport select jtag; init; svf $(TOP).svf; exit"


prog_flash:
	openocd -f /usr/share/trellis/misc/openocd/ecp5-evn.cfg -c "external_flash_spi_ecp5 0 0 $(TOP).bit"

clean:
	rm -f *.out *.vcd *.dump *.vpp *.json *.asc *.tcf *.bit *.config *.svf *.svg *synth.v *.log
