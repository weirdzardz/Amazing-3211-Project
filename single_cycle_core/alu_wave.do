onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alutestbench/clk
add wave -noupdate /alutestbench/rst
add wave -noupdate -expand -group ALU /alutestbench/alucontrol
add wave -noupdate -expand -group ALU -radix hexadecimal /alutestbench/src_a
add wave -noupdate -expand -group ALU -radix hexadecimal /alutestbench/src_b
add wave -noupdate -expand -group ALU -radix hexadecimal /alutestbench/res
add wave -noupdate -expand -group ALU /alutestbench/zero
add wave -noupdate -expand -group ALU_ref -radix hexadecimal /alutestbench/res_ref
add wave -noupdate -expand -group ALU_ref /alutestbench/zero_ref
add wave -noupdate /alutestbench/pass_or_fail
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {192769 ps} 0}
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
