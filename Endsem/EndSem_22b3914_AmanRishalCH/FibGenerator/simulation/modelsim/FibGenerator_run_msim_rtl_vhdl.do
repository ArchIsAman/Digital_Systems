transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/J_KFF.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/Gates.vhdl}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/Clock_Divider.vhdl}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/TwoToOneMultiplexer.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/SIX_BIT_ADDER.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/Register6bit.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/FULL_ADDER.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/FibGenerator.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/DFF_JK.vhd}

vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/FibGenerator/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
