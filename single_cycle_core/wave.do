onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_in
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/data_out
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/write_data
add wave -noupdate -radix hexadecimal -subitemconfig {/single_cycle_core_testbench/uut/data_mem/sig_data_mem(0) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(1) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(2) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(3) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(4) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(5) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(6) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(7) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(8) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(9) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(10) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(11) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(12) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(13) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(14) {-radix hexadecimal} /single_cycle_core_testbench/uut/data_mem/sig_data_mem(15) {-radix hexadecimal}} /single_cycle_core_testbench/uut/data_mem/sig_data_mem
add wave -noupdate /single_cycle_core_testbench/uut/reg_file/reset
add wave -noupdate /single_cycle_core_testbench/uut/reg_file/clk
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/single_cycle_core_testbench/uut/reg_file/sig_regfile(0) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(1) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(2) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(3) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(4) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(5) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(6) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(7) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(8) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(9) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(10) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(11) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(12) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(13) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(14) {-height 15 -radix hexadecimal} /single_cycle_core_testbench/uut/reg_file/sig_regfile(15) {-height 15 -radix hexadecimal}} /single_cycle_core_testbench/uut/reg_file/sig_regfile
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {900000 ps} 0}
configure wave -namecolwidth 287
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1650688 ps}
