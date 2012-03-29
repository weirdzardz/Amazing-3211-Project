onerror {resume}

add wave -noupdate -format Logic /Testbench/clk
add wave -noupdate -format Logic /Testbench/rst
add wave -noupdate -format Logic /Testbench/pass_or_fail

add wave -noupdate -group io -format Logic /Testbench/req_n
add wave -noupdate -group io -format Logic /Testbench/ack_n
add wave -noupdate -group io -format Literal -radix hexadecimal /Testbench/x_y
add wave -noupdate -group io -format Literal -radix hexadecimal /Testbench/sum
add wave -noupdate -group io -format Logic /Testbench/cout
add wave -noupdate -group io -format Logic /Testbench/valid

add wave -noupdate -group debug -format Literal /Testbench/i_dut/state
add wave -noupdate -group debug -format Logic /Testbench/i_dut/x_reg_wr_en
add wave -noupdate -group debug -format Literal -radix hexadecimal /Testbench/i_dut/x_reg
add wave -noupdate -group debug -format Logic /Testbench/i_dut/y_reg_wr_en
add wave -noupdate -group debug -format Literal -radix hexadecimal /Testbench/i_dut/y_reg
add wave -noupdate -group debug -format Literal -radix hexadecimal /Testbench/i_dut/adder_sum
add wave -noupdate -group debug -format Logic /Testbench/i_dut/adder_cout
add wave -noupdate -group debug -format Logic /Testbench/i_dut/cs_reg_wr_en
add wave -noupdate -group debug -format Literal -radix hexadecimal /Testbench/i_dut/cs_reg

