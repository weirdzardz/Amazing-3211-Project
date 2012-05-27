
## 1. create the library
vlib work

## 2. compile the dut
vcom "adder_8b.vhd"
vcom "alu.vhd"
vcom "Comparator.vhd"


## 2. compile the tb
vcom "alu_test_bench.vhd"

## 3. load the design
vsim -novopt ALUTestBench

## ModelSim6.2+ : vsim -novopt TestBench

## 4. add wave 
do alu_wave.do

## 4. run simulation
run 50us
