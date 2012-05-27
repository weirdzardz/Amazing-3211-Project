onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Pink -format Literal -radix unsigned /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label R0 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(0)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label i -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(1)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label j -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(2)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label k -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(3)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label kN -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(4)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label jN -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(5)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label N -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(6)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label memA -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(7)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label memB -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(8)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label memC -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(9)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label indexA -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(10)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label indexB -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(11)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label indexC -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(12)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label temp1 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(13)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label temp2 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(14)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -format Literal -label temp3 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(15)
add wave -noupdate -expand -group {Data Memory} -expand -group N -format Literal -label N -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(0)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(1)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(2)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(3)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(4)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(5)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(6)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(7)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(8)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(9)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(10)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(11)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(12)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(13)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(14)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(15)
add wave -noupdate -expand -group {Data Memory} -group A -color Orange -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(16)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(17)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(18)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(19)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(20)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(21)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(22)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(23)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(24)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(25)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(26)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(27)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(28)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(29)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(30)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(31)
add wave -noupdate -expand -group {Data Memory} -group B -color {Lime Green} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(32)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(33)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(34)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(35)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(36)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(37)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(38)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(39)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(40)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(41)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(42)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(43)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(44)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(45)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(46)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(47)
add wave -noupdate -expand -group {Data Memory} -expand -group C -color Yellow -format Literal -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(48)
add wave -noupdate -format Logic /single_cycle_core_testbench/clk
add wave -noupdate -format Logic /single_cycle_core_testbench/reset
add wave -noupdate -expand -group ALU -format Logic -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/zero
add wave -noupdate -expand -group ALU -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_b
add wave -noupdate -expand -group ALU -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_a
add wave -noupdate -group {Mux Branch} -format Logic /single_cycle_core_testbench/uut/mux_branch/mux_select
add wave -noupdate -group {Mux Branch} -format Literal /single_cycle_core_testbench/uut/mux_branch/data_out
add wave -noupdate -group {Mux Branch} -format Literal /single_cycle_core_testbench/uut/mux_branch/data_b
add wave -noupdate -group {Mux Branch} -format Literal /single_cycle_core_testbench/uut/mux_branch/data_a
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -group {Register File} -format Logic -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -group {Register File} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -group {Control Unit} -format Literal -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -group {Control Unit} -format Literal -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -group {Control Unit} -format Logic /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -group {Control Unit} -format Logic /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -group {Control Unit} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/res
add wave -noupdate -group Branch -format Logic /single_cycle_core_testbench/uut/sig_alu_zero
add wave -noupdate -group Branch -format Logic /single_cycle_core_testbench/uut/sig_branch
add wave -noupdate -group Branch -format Literal /single_cycle_core_testbench/uut/sig_branch_mux
add wave -noupdate -expand -group {Instruction Memory} -format Literal -radix hexadecimal /single_cycle_core_testbench/uut/insn_mem/insn_out
add wave -noupdate -expand -group {Instruction Memory} -format Literal /single_cycle_core_testbench/uut/insn_mem/addr_in
add wave -noupdate -format Literal -label {ALL REGISTERS} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile
add wave -noupdate -format Literal -radix unsigned /single_cycle_core_testbench/uut/data_mem/mem_process/var_data_mem
add wave -noupdate -format Literal /single_cycle_core_testbench/uut/data_mem/mem_process/var_addr
add wave -noupdate -format Logic /single_cycle_core_testbench/uut/sig_mem_write
add wave -noupdate -format Logic /single_cycle_core_testbench/uut/sig_mem_to_reg
add wave -noupdate -format Literal -radix decimal -expand /single_cycle_core_testbench/uut/sig_data_mem_out
add wave -noupdate -format Literal /single_cycle_core_testbench/uut/sig_alucontrol
add wave -noupdate -format Literal -radix unsigned /single_cycle_core_testbench/uut/sig_dm_addrin
add wave -noupdate -color {Orange Red} -format Literal -radix decimal /single_cycle_core_testbench/uut/sig_alu_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20125 ns} 0}
configure wave -namecolwidth 405
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {20119 ns} {20278 ns}
