
## 1. create the library
vlib work

## 2. compile the dut
vcom "adder_4b.vhd"
vcom "adder_16b.vhd"
vcom "control_unit.vhd"
vcom "data_memory.vhd"
vcom "instruction_memory.vhd"
vcom "mux_2to1_1b.vhd"
vcom "mux_2to1_4b.vhd"
vcom "mux_2to1_16b.vhd"
vcom "program_counter.vhd"
vcom "register_file.vhd"
vcom "sign_extend_4to16.vhd"
vcom "single_cycle_core.vhd"

## 2. compile the tb
vcom "TestBench_Exercise.vhd"

## 3. load the design
vsim -novopt TestBench
## ModelSim6.2+ : vsim -novopt TestBench

## 4. add wave 
do wave.do

## 4. run simulation
run 50us
