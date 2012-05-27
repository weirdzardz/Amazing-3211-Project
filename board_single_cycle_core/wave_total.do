onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /single_cycle_core_testbench/clk
add wave -noupdate /single_cycle_core_testbench/reset
add wave -noupdate -expand -group {Program Counter} -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_in
add wave -noupdate -expand -group {Program Counter} -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -expand -group {Mux Jump} /single_cycle_core_testbench/uut/mux_jump/mux_select
add wave -noupdate -expand -group {Mux Jump} /single_cycle_core_testbench/uut/mux_jump/data_out
add wave -noupdate -expand -group {Mux Jump} /single_cycle_core_testbench/uut/mux_jump/data_b
add wave -noupdate -expand -group {Mux Jump} /single_cycle_core_testbench/uut/mux_jump/data_a
add wave -noupdate -expand -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/mux_select
add wave -noupdate -expand -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/data_out
add wave -noupdate -expand -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/data_b
add wave -noupdate -expand -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/data_a
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/data_out
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/write_data
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -expand -group {Register File} -radix hexadecimal -expand -subitemconfig {/single_cycle_core_testbench/uut/reg_file/sig_regfile(0) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(1) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(2) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(3) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(4) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(5) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(6) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(7) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(8) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(9) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(10) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(11) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(12) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(13) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(14) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(15) {-height 15 -radix hexadecimal}} /single_cycle_core_testbench/uut/reg_file/sig_regfile
add wave -noupdate -group {Control Unit} -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -group {Control Unit} -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -group {Control Unit} /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -group {Control Unit} /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -group {Control Unit} -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/res
add wave -noupdate -group Branch /single_cycle_core_testbench/uut/sig_alu_zero
add wave -noupdate -group Branch /single_cycle_core_testbench/uut/sig_branch
add wave -noupdate -group Branch /single_cycle_core_testbench/uut/sig_branch_mux
add wave -noupdate -expand -group {Instruction Memory} -radix hexadecimal /single_cycle_core_testbench/uut/insn_mem/insn_out
add wave -noupdate -expand -group {Instruction Memory} /single_cycle_core_testbench/uut/insn_mem/addr_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2285000 ps} 0}
configure wave -namecolwidth 229
configure wave -valuecolwidth 39
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
WaveRestoreZoom {246128 ps} {742100 ps}
