onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /single_cycle_core_testbench/clk
add wave -noupdate /single_cycle_core_testbench/reset
add wave -noupdate /single_cycle_core_testbench/uut/sig_opcode_input
add wave -noupdate -group {Program Counter} -radix unsigned /single_cycle_core_testbench/uut/pc/addr_in
add wave -noupdate -group {Program Counter} -radix unsigned /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/ex_mem_regwrite
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mem_wb_regwrite
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/ex_mem_reg_rd
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mem_wb_reg_rd
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/id_ex_reg_rs
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/id_ex_reg_rt
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mux_sig_a
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mux_sig_b
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/sig_forwarding_a
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/sig_forwarding_b
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mem_hazard_rs_ok
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/mem_hazard_rt_ok
add wave -noupdate -group {FORWARDING UNIT} -color {Slate Blue} /single_cycle_core_testbench/uut/forwarding_unit/zeros
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_memread
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_write_reg
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_a
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_b
add wave -noupdate -group {Hazard Detection Unit} -color Red /single_cycle_core_testbench/uut/harzard_detection_unit/stall
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/sig_stall
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_memread
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_write_reg
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_a
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_b
add wave -noupdate -group {Hazard Detection Unit} -color Red /single_cycle_core_testbench/uut/harzard_detection_unit/stall
add wave -noupdate -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/sig_stall
add wave -noupdate -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/ctrl_unit/alu_src
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -group {Control Unit} -color Yellow -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/res
add wave -noupdate -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/ctrl_unit/alu_src
add wave -noupdate -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -group {Control Unit} -color Yellow -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/res
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label R0 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(0)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label I -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(1)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label J -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(2)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label K -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(3)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label KN -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(4)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label IN -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(5)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label N -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(6)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label MEMA -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(7)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label MEMB -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(8)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label MEMC -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(9)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label INDEXA -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(10)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label INDEXB -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(11)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label INDEXC -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(12)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label TEMP1 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(13)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label TEMP2 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(14)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -label TEMP3 -radix decimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(15)
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/mux_select
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_a
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_b
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_c
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_out
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/mux_select
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_a
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_b
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_c
add wave -noupdate -group Mux_ALU_a -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_a/data_out
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/mux_select
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_a
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_b
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_c
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_out
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/mux_select
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_a
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_b
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_c
add wave -noupdate -group Mux_ALU_b -radix hexadecimal /single_cycle_core_testbench/uut/my_mux_alu_b/data_out
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/mux_select
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_a
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_b
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_out
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/mux_select
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_a
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_b
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_out
add wave -noupdate -group IF/ID /single_cycle_core_testbench/uut/if_id_ppl_reg/reset
add wave -noupdate -group IF/ID /single_cycle_core_testbench/uut/if_id_ppl_reg/clk
add wave -noupdate -group IF/ID -color Yellow /single_cycle_core_testbench/uut/if_id_ppl_reg/flush
add wave -noupdate -group IF/ID -radix binary /single_cycle_core_testbench/uut/if_id_ppl_reg/instruction_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/reset
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/clk
add wave -noupdate -group ID/EX /single_cycle_core_testbench/uut/id_ex_ppl_reg/flush
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/alu_ctl_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/mem_write_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/mem_to_reg_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/write_reg_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/reg_write_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/read_a_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/read_b_out
add wave -noupdate -group ID/EX /single_cycle_core_testbench/uut/id_ex_ppl_reg/reg_s_out
add wave -noupdate -group ID/EX /single_cycle_core_testbench/uut/id_ex_ppl_reg/reg_t_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/reset
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/clk
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/mem_write_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/mem_to_reg_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/write_reg_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/reg_write_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/data_b_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/alu_result_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/reset
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/clk
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/mem_write_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/mem_to_reg_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/write_reg_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/reg_write_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/alu_result_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/reset
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/clk
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/mem_to_reg_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/write_reg_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/reg_write_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/alu_result_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/data_mem_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/reset
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/clk
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/mem_to_reg_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/write_reg_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/reg_write_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/alu_result_out
add wave -noupdate -group MEM/WB -radix hexadecimal /single_cycle_core_testbench/uut/mem_wb_ppl_reg/data_mem_out
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/zero
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/sig_res
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_b
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_a
add wave -noupdate -group ALU /single_cycle_core_testbench/uut/alu_unit/alucontrol
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/zero
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/sig_res
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_b
add wave -noupdate -group ALU -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/src_a
add wave -noupdate -group ALU /single_cycle_core_testbench/uut/alu_unit/alucontrol
add wave -noupdate -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/mux_select
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_out
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_a
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_b
add wave -noupdate -expand -group DATAMEM /single_cycle_core_testbench/uut/data_mem/write_enable
add wave -noupdate -expand -group DATAMEM -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/write_data
add wave -noupdate -expand -group DATAMEM -radix decimal /single_cycle_core_testbench/uut/data_mem/addr_in
add wave -noupdate -expand -group DATAMEM -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/data_out
add wave -noupdate -expand -group DATAMEM -group N -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(0)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(1)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(2)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(3)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(4)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(5)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(6)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(7)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(8)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(9)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(10)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(11)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(12)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(13)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(14)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(15)
add wave -noupdate -expand -group DATAMEM -group A -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(16)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(17)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(18)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(19)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(20)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(21)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(22)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(23)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(24)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(25)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(26)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(27)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(28)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(29)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(30)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(31)
add wave -noupdate -expand -group DATAMEM -group B -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(32)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(33)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(34)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(35)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(36)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(37)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(38)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(39)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(40)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(41)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(42)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(43)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(44)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(45)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(46)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(47)
add wave -noupdate -expand -group DATAMEM -expand -group C -color Cyan -radix decimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem(48)
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -group {Instruction Memory} -radix hexadecimal /single_cycle_core_testbench/uut/insn_mem/insn_out
add wave -noupdate -group {Instruction Memory} /single_cycle_core_testbench/uut/insn_mem/addr_in
add wave -noupdate -group {Instruction Memory} -radix hexadecimal /single_cycle_core_testbench/uut/insn_mem/insn_out
add wave -noupdate -group {Instruction Memory} /single_cycle_core_testbench/uut/insn_mem/addr_in
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_in
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_out
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_in
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_out
add wave -noupdate -group {MUX ALUSRC} /single_cycle_core_testbench/uut/mux_alu_src/mux_select
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_a
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_b
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_out
add wave -noupdate -group {MUX ALUSRC} /single_cycle_core_testbench/uut/mux_alu_src/mux_select
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_a
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_b
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6003459 ps} 0}
configure wave -namecolwidth 443
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
WaveRestoreZoom {5995500 ps} {6105500 ps}
