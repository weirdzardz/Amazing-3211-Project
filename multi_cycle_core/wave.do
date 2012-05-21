onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /single_cycle_core_testbench/clk
add wave -noupdate /single_cycle_core_testbench/reset
add wave -noupdate /single_cycle_core_testbench/uut/sig_opcode_input
add wave -noupdate -expand -group {Program Counter} -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_in
add wave -noupdate -expand -group {Program Counter} -radix hexadecimal /single_cycle_core_testbench/uut/pc/addr_out
add wave -noupdate -expand -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_memread
add wave -noupdate -expand -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/ex_write_reg
add wave -noupdate -expand -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_a
add wave -noupdate -expand -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/id_reg_b
add wave -noupdate -expand -group {Hazard Detection Unit} -color Red /single_cycle_core_testbench/uut/harzard_detection_unit/stall
add wave -noupdate -expand -group {Hazard Detection Unit} -color Salmon /single_cycle_core_testbench/uut/harzard_detection_unit/sig_stall
add wave -noupdate -expand -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/opcode
add wave -noupdate -expand -group {Control Unit} -color Yellow -radix binary /single_cycle_core_testbench/uut/ctrl_unit/alucontrol
add wave -noupdate -expand -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_beq
add wave -noupdate -expand -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/ctrl_unit/alu_src
add wave -noupdate -expand -group {Control Unit} -color Yellow /single_cycle_core_testbench/uut/alu_unit/sig_zero
add wave -noupdate -expand -group {Control Unit} -color Yellow -radix hexadecimal /single_cycle_core_testbench/uut/alu_unit/res
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label R0 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(0)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label I -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(1)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label J -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(2)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label K -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(3)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label KN -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(4)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label IN -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(5)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label N -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(6)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label MEMA -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(7)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label MEMB -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(8)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label MEMC -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(9)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label INDEXA -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(10)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label INDEXB -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(11)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label INDEXC -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(12)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label TEMP1 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(13)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label TEMP2 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(14)
add wave -noupdate -expand -group REGISTERS -color {Cornflower Blue} -height 15 -label TEMP3 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(15)
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
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_write_ex_mem
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_write_mem_wb
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_d_ex_mem
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_d_mem_wb
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_s_id_ex
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/reg_t_id_ex
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/mux_sig_a
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/mux_sig_b
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_ex_mem_not_zero
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_mem_wb_not_zero
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_ex_mem_eq_rs_id_ex
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_ex_mem_eq_rt_id_ex
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_mem_wb_eq_rs_id_ex
add wave -noupdate -group {Forwarding Unit} /single_cycle_core_testbench/uut/forwarding_unit/sig_is_rd_mem_wb_eq_rt_id_ex
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/mux_select
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_a
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_b
add wave -noupdate -group {MUX MEM/WB} -radix hexadecimal /single_cycle_core_testbench/uut/mux_mem_to_reg/data_out
add wave -noupdate -group IF/ID /single_cycle_core_testbench/uut/if_id_ppl_reg/reset
add wave -noupdate -group IF/ID /single_cycle_core_testbench/uut/if_id_ppl_reg/clk
add wave -noupdate -group IF/ID -radix hexadecimal /single_cycle_core_testbench/uut/if_id_ppl_reg/instruction_out
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/reset
add wave -noupdate -group ID/EX -radix hexadecimal /single_cycle_core_testbench/uut/id_ex_ppl_reg/clk
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
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/alu_zero_out
add wave -noupdate -group EX/MEM -radix hexadecimal /single_cycle_core_testbench/uut/ex_mem_ppl_reg/alu_result_out
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
add wave -noupdate -group {Mux Branch} /single_cycle_core_testbench/uut/mux_branch/mux_select
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_out
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_b
add wave -noupdate -group {Mux Branch} -radix hexadecimal /single_cycle_core_testbench/uut/mux_branch/data_a
add wave -noupdate -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/data_out
add wave -noupdate -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/write_data
add wave -noupdate -group {Data Memory} -radix hexadecimal /single_cycle_core_testbench/uut/data_mem/sig_data_mem
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_a
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_register_b
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_enable
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_register
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/write_data
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_a
add wave -noupdate -expand -group {Register File} -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/read_data_b
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(0)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(1)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(2)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(3)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(4)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(5)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(6)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(7)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(8)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(9)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(10)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(11)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(12)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(13)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(14)
add wave -noupdate -height 15 -radix hexadecimal /single_cycle_core_testbench/uut/reg_file/sig_regfile(15)
add wave -noupdate -group {Instruction Memory} -radix hexadecimal /single_cycle_core_testbench/uut/insn_mem/insn_out
add wave -noupdate -group {Instruction Memory} /single_cycle_core_testbench/uut/insn_mem/addr_in
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_in
add wave -noupdate -group {Sign Ext} -radix hexadecimal /single_cycle_core_testbench/uut/sign_extend/data_out
add wave -noupdate -group {MUX ALUSRC} /single_cycle_core_testbench/uut/mux_alu_src/mux_select
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_a
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_b
add wave -noupdate -group {MUX ALUSRC} -radix hexadecimal /single_cycle_core_testbench/uut/mux_alu_src/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {364012 ps} 0}
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
WaveRestoreZoom {269304 ps} {379241 ps}
