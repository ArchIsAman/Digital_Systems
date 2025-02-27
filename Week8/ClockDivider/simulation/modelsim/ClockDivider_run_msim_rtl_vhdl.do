transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/v_jtag.vhd}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/TopLevel.vhdl}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/DUT.vhdl}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/led.vhd}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/TwoHertzClock.vhd}

vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week8/ClockDivider/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
