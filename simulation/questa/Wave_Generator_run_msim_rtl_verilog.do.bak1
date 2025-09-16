transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Project/Bach_Khoa/Wave_Generator/src {E:/Project/Bach_Khoa/Wave_Generator/src/phase_accumulator.v}
vlog -vlog01compat -work work +incdir+E:/Project/Bach_Khoa/Wave_Generator/src {E:/Project/Bach_Khoa/Wave_Generator/src/full_sine_lut.v}
vlog -vlog01compat -work work +incdir+E:/Project/Bach_Khoa/Wave_Generator/src {E:/Project/Bach_Khoa/Wave_Generator/src/sin_wave.v}
vlog -vlog01compat -work work +incdir+E:/Project/Bach_Khoa/Wave_Generator/src {E:/Project/Bach_Khoa/Wave_Generator/src/sin_lut.v}

