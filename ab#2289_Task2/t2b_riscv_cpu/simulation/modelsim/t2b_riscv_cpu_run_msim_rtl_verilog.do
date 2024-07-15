transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/store_extend.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/reset_ff.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/reg_file.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/mux4.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/mux2.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/main_decoder.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/load_extend.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/imm_extend.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/datapath.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/controller.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/alu_decoder.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/alu.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/components {D:/t2b_riscv_cpu/t2b_riscv_cpu/components/adder.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu {D:/t2b_riscv_cpu/t2b_riscv_cpu/data_mem.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu {D:/t2b_riscv_cpu/t2b_riscv_cpu/riscv_cpu.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu {D:/t2b_riscv_cpu/t2b_riscv_cpu/t2b_riscv_cpu.v}
vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu {D:/t2b_riscv_cpu/t2b_riscv_cpu/instr_mem.v}

vlog -vlog01compat -work work +incdir+D:/t2b_riscv_cpu/t2b_riscv_cpu/simulation/modelsim {D:/t2b_riscv_cpu/t2b_riscv_cpu/simulation/modelsim/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 5 ms
