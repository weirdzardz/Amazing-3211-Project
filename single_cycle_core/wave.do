onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_in
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/data_out
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/write_data
add wave -noupdate -expand -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem
add wave -noupdate -group {Register File} /single_cycle_core_testbench/uut/reg_file/reset
add wave -noupdate -group {Register File} /single_cycle_core_testbench/uut/reg_file/clk
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -group {Register File} -radix hexadecimal -expand -subitemconfig {/single_cycle_core_testbench/uut/reg_file/sig_regfile(0) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(1) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(2) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(3) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(4) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(5) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(6) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(7) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(8) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(9) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(10) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(11) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(12) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(13) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(14) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(15) {-height 15 -radix hexadecimal}} /single_cycle_core_testbench/uut/reg_file/sig_regfile
add wave -noupdate -expand -group {Control Unit} -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -expand -group {Control Unit} -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -expand -group {Control Unit} /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -expand -group {Control Unit} /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -expand -group Branch /single_cycle_core_testbench/uut/sig_alu_zero
add wave -noupdate -expand -group Branch /single_cycle_core_testbench/uut/sig_branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2160682 ps} 0}
configure wave -namecolwidth 365
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
WaveRestoreZoom {1013187 ps} {2453493 ps}
