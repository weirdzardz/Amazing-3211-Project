
## 1. create the library
vlib work

## 2. compile the dut
vcom "*.vhd"

## 2. compile the tb
#vcom "TestBench_Exercise.vhd"
vcom "single_cycle_core_testbench.vhd"

## 3. load the design
vsim -novopt single_cycle_core_testbench

## ModelSim6.2+ : vsim -novopt TestBench

## 4. add wave 
do wave.do

## 5. run simulation
run 50us
