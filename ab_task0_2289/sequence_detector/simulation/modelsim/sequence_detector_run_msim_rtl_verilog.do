transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sdsha/Documents/IITB/eYRC/task0/sequence_detector {C:/Users/sdsha/Documents/IITB/eYRC/task0/sequence_detector/sequence_detector.v}

vlog -vlog01compat -work work +incdir+C:/Users/sdsha/Documents/IITB/eYRC/task0/sequence_detector/simulation/modelsim {C:/Users/sdsha/Documents/IITB/eYRC/task0/sequence_detector/simulation/modelsim/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 4000 ps
