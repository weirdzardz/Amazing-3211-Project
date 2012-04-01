onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {adder 1} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder1/x_in
add wave -noupdate -expand -group {adder 1} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder1/y_in
add wave -noupdate -expand -group {adder 1} /alutestbench/i_dut/my_addsumunit/adder1/c_in
add wave -noupdate -expand -group {adder 1} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder1/sum
add wave -noupdate -expand -group {adder 1} /alutestbench/i_dut/my_addsumunit/adder1/c_out
add wave -noupdate -expand -group {adder 1} /alutestbench/i_dut/my_addsumunit/adder1/prev_cout
add wave -noupdate -expand -group {adder 2} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder2/x_in
add wave -noupdate -expand -group {adder 2} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder2/y_in
add wave -noupdate -expand -group {adder 2} /alutestbench/i_dut/my_addsumunit/adder2/c_in
add wave -noupdate -expand -group {adder 2} -radix hexadecimal /alutestbench/i_dut/my_addsumunit/adder2/sum
add wave -noupdate -expand -group {adder 2} /alutestbench/i_dut/my_addsumunit/adder2/c_out
add wave -noupdate -expand -group {adder 2} /alutestbench/i_dut/my_addsumunit/adder2/prev_cout
add wave -noupdate -expand -group alu /alutestbench/i_dut/alucontrol
add wave -noupdate -expand -group alu -radix hexadecimal /alutestbench/i_dut/src_a
add wave -noupdate -expand -group alu -radix hexadecimal /alutestbench/i_dut/src_b
add wave -noupdate -expand -group alu -radix hexadecimal /alutestbench/i_dut/res
add wave -noupdate -expand -group alu /alutestbench/i_dut/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49674378 ps} 0}
configure wave -namecolwidth 225
configure wave -valuecolwidth 181
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
WaveRestoreZoom {49614907 ps} {50020269 ps}
