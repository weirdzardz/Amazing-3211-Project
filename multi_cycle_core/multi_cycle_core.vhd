---------------------------------------------------------------------------
-- single_cycle_core.vhd - A Single-Cycle Processor Implementation
--
-- Notes : 
--
-- See single_cycle_core.pdf for the block diagram of this single
-- cycle processor core.
--
-- Instruction Set Architecture (ISA) for the single-cycle-core:
--   Each instruction is 16-bit wide, with four 4-bit fields.
--
--     noop      
--        # no operation or to signal end of program
--        # format:  | opcode = 0 |  0   |  0   |   0    | 
--
--     load  rt, rs, offset     
--        # load data at memory location (rs + offset) into rt
--        # format:  | opcode = 1 |  rs  |  rt  | offset |
--
--     store rt, rs, offset
--        # store data rt into memory location (rs + offset)
--        # format:  | opcode = 3 |  rs  |  rt  | offset |
--
--     add   rd, rs, rt
--        # rd <- rs + rt
--        # format:  | opcode = 8 |  rs  |  rt  |   rd   |
--
--
-- Copyright (C) 2006 by Lih Wen Koh (lwkoh@cse.unsw.edu.au)
-- All Rights Reserved. 
--
-- The single-cycle processor core is provided AS IS, with no warranty of 
-- any kind, express or implied. The user of the program accepts full 
-- responsibility for the application of the program and the use of any 
-- results. This work may be downloaded, compiled, executed, copied, and 
-- modified solely for nonprofit, educational, noncommercial research, and 
-- noncommercial scholarship purposes provided that this notice in its 
-- entirety accompanies all copies. Copies of the modified software can be 
-- delivered to persons who use it solely for nonprofit, educational, 
-- noncommercial research, and noncommercial scholarship purposes provided 
-- that this notice in its entirety accompanies all copies.
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multi_cycle_core is
    port ( reset  : in  std_logic;
           clk    : in  std_logic );
end multi_cycle_core;

architecture structural of multi_cycle_core is

component program_counter is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           write_enable  : in std_logic; --NEW ENABLE SIG
           addr_in  : in  std_logic_vector(4 downto 0);
           addr_out : out std_logic_vector(4 downto 0) );
end component;

component instruction_memory is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(4 downto 0);
           insn_out : out std_logic_vector(15 downto 0) );
end component;


component mux_2to1_4b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(3 downto 0);
           data_b     : in  std_logic_vector(3 downto 0);
           data_out   : out std_logic_vector(3 downto 0) );
end component;

component mux_2to1_3b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(2 downto 0);
           data_b     : in  std_logic_vector(2 downto 0);
           data_out   : out std_logic_vector(2 downto 0) );
end component;

component mux_2to1_5b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(4 downto 0);
           data_b     : in  std_logic_vector(4 downto 0);
           data_out   : out std_logic_vector(4 downto 0) );
end component;

component mux_2to1_16b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
end component;

component mux_2to1_7b is --NEW MUX
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(6 downto 0);
           data_b     : in  std_logic_vector(6 downto 0);
           data_out   : out std_logic_vector(6 downto 0) );
end component;

component mux_3to1_16b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_c     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
end component;

component control_unit is
    port ( opcode     : in  std_logic_vector(2 downto 0);
           reg_dst    : out std_logic;
           reg_write  : out std_logic;
           alu_src    : out std_logic;
           mem_write  : out std_logic;
           mem_to_reg : out std_logic;
           
           alucontrol : out std_logic_vector (1 downto 0)
           );
end component;

component register_file is
    port ( reset           : in  std_logic;
           clk             : in  std_logic;
           read_register_a : in  std_logic_vector(3 downto 0);
           read_register_b : in  std_logic_vector(3 downto 0);
           write_enable    : in  std_logic;
           write_register  : in  std_logic_vector(3 downto 0);
           write_data      : in  std_logic_vector(15 downto 0);
           read_data_a     : out std_logic_vector(15 downto 0);
           read_data_b     : out std_logic_vector(15 downto 0) );
end component;

component sign_extend_4to16 is
    port ( data_in  : in  std_logic_vector(4 downto 0);
           data_out : out std_logic_vector(15 downto 0) );
end component;

component adder_5b is
    port ( src_a     : in  std_logic_vector(4 downto 0);
           src_b     : in  std_logic_vector(4 downto 0);
           sum       : out std_logic_vector(4 downto 0);
           carry_out : out std_logic );
end component;

component alu is
    port ( alucontrol: in std_logic_vector (1 downto 0); --just one bit for now to control add/sub
           src_a     : in  std_logic_vector(15 downto 0);
           src_b     : in  std_logic_vector(15 downto 0);
           res    : out std_logic_vector(15 downto 0);
           zero      : out std_logic );
end component;

component data_memory is
    port ( reset        : in  std_logic;
           clk          : in  std_logic;
           write_enable : in  std_logic;
           write_data   : in  std_logic_vector(15 downto 0);
           addr_in      : in  std_logic_vector(8 downto 0);
           data_out     : out std_logic_vector(15 downto 0) );
end component;

component if_id_reg is 
    port( reset         : in std_logic;
          clk           : in std_logic;
          write_enable  : in std_logic; --NEW ENABLE SIG
          flush         : in std_logic;
          instruction_in   : in std_logic_vector(15 downto 0);
          instruction_out : out std_logic_vector(15 downto 0)  
    );
end component;

component id_ex_reg is
    port( reset         : in std_logic;
          clk           : in std_logic;
          alu_ctl_in    : in std_logic_vector(1 downto 0);
          alu_ctl_out   : out std_logic_vector(1 downto 0);
          mem_write_in  : in std_logic;
          mem_to_reg_in : in std_logic;
          mem_write_out : out std_logic;
          mem_to_reg_out: out std_logic;
          reg_s_in    : in std_logic_vector(3 downto 0);
          reg_s_out   : out std_logic_vector(3 downto 0);
          reg_t_in    : in std_logic_vector(3 downto 0);
          reg_t_out   : out std_logic_vector(3 downto 0); 
          write_reg_in    : in std_logic_vector(3 downto 0);
          write_reg_out   : out std_logic_vector(3 downto 0);
          reg_write_in  : in std_logic;
          reg_write_out : out std_logic;          
          read_a_in  : in std_logic_vector(15 downto 0);
          read_b_in  : in std_logic_vector(15 downto 0);
          read_a_out : out std_logic_vector(15 downto 0);
          read_b_out : out std_logic_vector(15 downto 0);
          read_b_nomux_in  : in std_logic_vector(15 downto 0);
          read_b_nomux_out : out std_logic_vector(15 downto 0);
          offset_in : in std_logic_vector(4 downto 0);
          offset_out : out std_logic_vector(4 downto 0) ;
          flush         : in std_logic --NEW FLUSH SIG 
    );
  
end component;
component ex_mem_reg is
port( reset         : in std_logic;
      clk           : in std_logic;
      mem_write_in  : in std_logic;
      mem_to_reg_in : in std_logic;
      mem_write_out : out std_logic;
      mem_to_reg_out: out std_logic;
      write_reg_in    : in std_logic_vector(3 downto 0);
      write_reg_out   : out std_logic_vector(3 downto 0);
      reg_write_in  : in std_logic;
      reg_write_out : out std_logic;
      data_b_in       : in std_logic_vector(15 downto 0);
      data_b_out        : out std_logic_vector(15 downto 0);  
               
      alu_result_in  : in std_logic_vector(15 downto 0);
      alu_result_out : out std_logic_vector(15 downto 0)
      
      
);
end component;

component mem_wb_reg is
port( reset         : in std_logic;
      clk           : in std_logic;
      mem_to_reg_in : in std_logic;
      mem_to_reg_out: out std_logic;
      write_reg_in    : in std_logic_vector(3 downto 0);
      write_reg_out   : out std_logic_vector(3 downto 0);
      reg_write_in  : in std_logic;
      reg_write_out : out std_logic;         
      alu_result_in  : in std_logic_vector(15 downto 0);
      alu_result_out : out std_logic_vector(15 downto 0);
      data_mem_in     :in std_logic_vector(15 downto 0);
      data_mem_out    :out std_logic_vector(15 downto 0)
      
        
);  
end component;

component forward_unit is
  port(
          EX_MEM_regWrite : in std_logic;
          MEM_WB_regWrite : in std_logic;
          EX_MEM_reg_rd   : in std_logic_vector(3 downto 0);
          MEM_WB_reg_rd   : in std_logic_vector(3 downto 0);
          ID_EX_reg_rs    : in std_logic_vector(3 downto 0);
          ID_EX_reg_rt    : in std_logic_vector(3 downto 0);
          mux_sig_a       : out std_logic_vector(1 downto 0);
          mux_sig_b       : out std_logic_vector (1 downto 0)
    );
  
end component;

component hazard_detection_unit is
    port ( 
        --load store hazard detect
		   EX_memread         : in std_logic;
		   EX_write_reg       : in std_logic_vector(3 downto 0);
		   ID_reg_a           : in std_logic_vector(3 downto 0);
		   ID_reg_b           : in std_logic_vector(3 downto 0);
		   stall              : out std_logic;
		   
		   --fush (branch) detect
		   branch             : in std_logic;
		   opcode             : in  std_logic_vector(2 downto 0);
		   if_flush           : out std_logic;
		   flush_id_ex        : out std_logic
           );  
end component;


signal sig_next_pc                  : std_logic_vector(4 downto 0);
signal sig_pc_inc                   : std_logic_vector(4 downto 0); --
signal sig_curr_pc                  : std_logic_vector(4 downto 0); --
signal sig_one_5b                   : std_logic_vector(4 downto 0);
signal sig_pc_carry_out             : std_logic;
signal sig_insn                     : std_logic_vector(15 downto 0);
signal sig_insn_to_ppl              : std_logic_vector(15 downto 0);
signal sig_reg_dst                  : std_logic;
signal sig_reg_write                : std_logic;
signal sig_reg_write_to_ppl_id_ex   : std_logic;
signal sig_reg_write_to_ppl_ex_mem  : std_logic;
signal sig_reg_write_to_ppl_mem_wb  : std_logic;
signal sig_mem_write                : std_logic;
signal sig_mem_to_reg               : std_logic;
signal sig_mem_write_to_ppl_id_ex         : std_logic;
signal sig_mem_to_reg_to_ppl_id_ex        : std_logic;
signal sig_mem_write_to_ppl_ex_mem         : std_logic;
signal sig_mem_to_reg_to_ppl_ex_mem        : std_logic;
signal sig_mem_write_to_ppl_mem_wb         : std_logic;
signal sig_mem_to_reg_to_ppl_mem_wb        : std_logic;
signal sig_write_reg_to_ppl_id_ex   : std_logic_vector(3 downto 0);
signal sig_write_reg_to_ppl_ex_mem  : std_logic_vector(3 downto 0);
signal sig_write_reg_to_ppl_mem_wb  : std_logic_vector(3 downto 0);
signal sig_write_register           : std_logic_vector(3 downto 0);
signal  sig_write_date_to_ppl_ex_mem : std_logic_vector(15 downto 0);
signal sig_reg_s_to_fu           : std_logic_vector(3 downto 0);
signal sig_reg_t_to_fu           : std_logic_vector(3 downto 0);
signal sig_write_data               : std_logic_vector(15 downto 0);
signal sig_read_data_a              : std_logic_vector(15 downto 0);
signal sig_read_data_b              : std_logic_vector(15 downto 0);
signal sig_read_data_b_to_mux              : std_logic_vector(15 downto 0);
signal sig_read_data_a_to_ppl       : std_logic_vector(15 downto 0);
signal sig_read_data_b_to_ppl_id_ex       : std_logic_vector(15 downto 0);
signal sig_read_data_b_to_ppl_ex_mem       : std_logic_vector(15 downto 0);

signal sig_alu_result_to_ppl_mem_wb : std_logic_vector(15 downto 0);
signal sig_alu_result_to_ppl_ex_mem : std_logic_vector(15 downto 0);
signal sig_alu_result_wb            : std_logic_vector(15 downto 0);

signal sig_data_mem_out_to_ppl             : std_logic_vector(15 downto 0);
signal sig_data_mem_out             : std_logic_vector(15 downto 0);

signal sig_alucontrol_to_ppl_ex_mem        : std_logic_vector (1 downto 0);
signal sig_alucontrol_to_ppl_id_ex        : std_logic_vector (1 downto 0);
signal sig_alucontrol_ex               : std_logic_vector (1 downto 0);

signal sig_alu_zero_ex                 : std_logic;
signal sig_alu_src                   : std_logic;
signal sig_branch                   : std_logic;
signal sig_sign_extended_offset   :std_logic_vector (15 downto 0);
-- took out jump and jump mux
signal sig_branch_mux           : std_logic_vector (4 downto 0);
signal sig_mux_alu_a                : std_logic_vector(1 downto 0);
signal sig_mux_alu_b                : std_logic_vector(1 downto 0);
signal sig_alu_a_in             	   : std_logic_vector(15 downto 0);
signal sig_alu_b_in             	   : std_logic_vector(15 downto 0);

signal sig_stall                    : std_logic;
signal sig_opcode_input             : std_logic_vector(2 downto 0);
signal sig_flush                 : std_logic;
signal sig_flush_id_ex            :std_logic;
signal sig_flush_id_ex_inter            :std_logic;
signal sig_offset_to_ex_mem   : std_logic_vector (4 downto 0);
signal sig_offset_to_pc  : std_logic_vector (4 downto 0);



begin

    sig_one_5b <= "00001";
    sig_branch <= sig_alucontrol_ex(1) AND sig_alucontrol_ex(0) AND  NOT(sig_alu_zero_ex);
    sig_flush_id_ex <= sig_flush or sig_flush_id_ex_inter;

    pc : program_counter
    port map ( reset    => reset,
               clk      => clk,
                write_enable => sig_stall,
             
               addr_in  => sig_next_pc,
               addr_out => sig_curr_pc ); 

    next_pc : adder_5b 
    port map ( src_a     => sig_curr_pc, 
               src_b     => sig_one_5b,
               sum       => sig_pc_inc,   
               carry_out => sig_pc_carry_out );
    
    insn_mem : instruction_memory 
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_curr_pc,
               insn_out => sig_insn_to_ppl );

    control_unit_mux: mux_2to1_3b 
    port map ( mux_select => sig_stall,
           data_a     => sig_insn(15 downto 13),
           data_b     => "000",
           data_out   => sig_opcode_input );


    ctrl_unit : control_unit 
    port map ( opcode     => sig_opcode_input , 
               reg_dst    => sig_reg_dst,
               reg_write  => sig_reg_write_to_ppl_id_ex,
               alu_src    => sig_alu_src,
               mem_write  => sig_mem_write_to_ppl_id_ex,
               mem_to_reg => sig_mem_to_reg_to_ppl_id_ex,
               alucontrol => sig_alucontrol_to_ppl_id_ex
               );
               
    sign_extend : sign_extend_4to16 
    port map ( data_in  => sig_insn(4 downto 0),
               data_out => sig_sign_extended_offset );

    reg_file : register_file 
    port map ( reset           => reset, 
               clk             => clk,
               read_register_a => sig_insn(12 downto 9),  --new bit range
               read_register_b => sig_insn(8 downto 5), --new bit range
               write_enable    => sig_reg_write,
               write_register  => sig_write_register,
               write_data      => sig_write_data,
               read_data_a     => sig_read_data_a_to_ppl,
               read_data_b     => sig_read_data_b_to_mux );

    alu_unit : alu 
    port map ( alucontrol => sig_alucontrol_ex,
               src_a     => sig_alu_a_in,
               src_b     => sig_alu_b_in,
               res       => sig_alu_result_to_ppl_ex_mem,
               zero => sig_alu_zero_ex );

    data_mem : data_memory 
    port map ( reset        => reset,
               clk          => clk,
               write_enable => sig_mem_write,
               write_data   => sig_read_data_b,
               addr_in      => sig_alu_result_to_ppl_mem_wb(8 downto 0),
               data_out     => sig_data_mem_out_to_ppl );
    
    mux_reg_dst : mux_2to1_4b 
    port map ( mux_select => sig_reg_dst,
               data_a     => sig_insn(8 downto 5),  --new bit range
               data_b     => sig_insn(3 downto 0),  --SAME bit range
               data_out   => sig_write_reg_to_ppl_id_ex );   
                          
    mux_mem_to_reg : mux_2to1_16b 
    port map ( mux_select => sig_mem_to_reg,
               data_a     => sig_alu_result_wb,
               data_b     => sig_data_mem_out,
               data_out   => sig_write_data );
               
    mux_branch : mux_2to1_5b 
    port map ( mux_select => sig_branch,
               data_a     => sig_pc_inc,
               data_b     => sig_offset_to_pc,
               data_out   => sig_next_pc );
                      
    mux_alu_src : mux_2to1_16b 
    port map ( mux_select => sig_alu_src,
               data_a     => sig_read_data_b_to_mux,
               data_b     => sig_sign_extended_offset,
               data_out   => sig_read_data_b_to_ppl_id_ex );                      
                                            
    if_id_ppl_reg: if_id_reg
    port map (reset => reset,
              clk => clk,
              write_enable => sig_stall,
              flush => sig_flush,
              instruction_in => sig_insn_to_ppl,
              instruction_out => sig_insn    
              ); 
              
    id_ex_ppl_reg : id_ex_reg
    port map (  reset =>reset,
                clk => clk,
                alu_ctl_in    => sig_alucontrol_to_ppl_id_ex,
                alu_ctl_out   => sig_alucontrol_ex,
                mem_write_in  => sig_mem_write_to_ppl_id_ex,
                mem_to_reg_in => sig_mem_to_reg_to_ppl_id_ex,
                mem_write_out => sig_mem_write_to_ppl_ex_mem,
                mem_to_reg_out => sig_mem_to_reg_to_ppl_ex_mem,
                reg_s_in => sig_insn(12 downto 9),
                reg_s_out => sig_reg_s_to_fu,
                reg_t_in => sig_insn(8 downto 5),
                reg_t_out  => sig_reg_t_to_fu ,
                write_reg_in    => sig_write_reg_to_ppl_id_ex,
                write_reg_out   => sig_write_reg_to_ppl_ex_mem,
                reg_write_in  => sig_reg_write_to_ppl_id_ex,
                reg_write_out => sig_reg_write_to_ppl_ex_mem,                            
                read_a_in => sig_read_data_a_to_ppl,
                read_b_in  => sig_read_data_b_to_ppl_id_ex,
                read_a_out => sig_read_data_a,
                read_b_out => sig_read_data_b_to_ppl_ex_mem,
                read_b_nomux_in  => sig_read_data_b_to_mux,
                read_b_nomux_out => sig_write_date_to_ppl_ex_mem,
                offset_in => sig_insn(4 downto 0),
                offset_out => sig_offset_to_pc,
                  flush  => sig_flush_id_ex
               );   
               
    ex_mem_ppl_reg : ex_mem_reg
    port map (  reset =>reset,
                clk => clk,
                mem_write_in  => sig_mem_write_to_ppl_ex_mem,
                mem_to_reg_in => sig_mem_to_reg_to_ppl_ex_mem,
                mem_write_out => sig_mem_write,
                mem_to_reg_out => sig_mem_to_reg_to_ppl_mem_wb,
                write_reg_in    => sig_write_reg_to_ppl_ex_mem,
                write_reg_out   => sig_write_reg_to_ppl_mem_wb,
                reg_write_in  => sig_reg_write_to_ppl_ex_mem,
                reg_write_out => sig_reg_write_to_ppl_mem_wb,
                data_b_in    => sig_write_date_to_ppl_ex_mem,
                data_b_out   => sig_read_data_b,                            
               
                alu_result_in => sig_alu_result_to_ppl_ex_mem,
                alu_result_out => sig_alu_result_to_ppl_mem_wb
                
                
               ); 
 --removed jump mux              

  mem_wb_ppl_reg : mem_wb_reg
    port map (  reset =>reset,
                clk => clk,
                mem_to_reg_in => sig_mem_to_reg_to_ppl_mem_wb,
                mem_to_reg_out => sig_mem_to_reg,
                write_reg_in    => sig_write_reg_to_ppl_mem_wb,
                write_reg_out   => sig_write_register,
                reg_write_in  => sig_reg_write_to_ppl_mem_wb,
                reg_write_out => sig_reg_write,
                alu_result_in => sig_alu_result_to_ppl_mem_wb,
                alu_result_out => sig_alu_result_wb,
                data_mem_in =>  sig_data_mem_out_to_ppl,
                data_mem_out => sig_data_mem_out
               ); 
  forwarding_unit : forward_unit
    port map( EX_MEM_regWrite => sig_reg_write_to_ppl_mem_wb,
              MEM_WB_regWrite => sig_reg_write,
              EX_MEM_reg_rd   => sig_write_reg_to_ppl_mem_wb,
              MEM_WB_reg_rd   => sig_write_register,
              ID_EX_reg_rs    => sig_reg_s_to_fu,
              ID_EX_reg_rt     => sig_reg_t_to_fu,
              mux_sig_a      => sig_mux_alu_a,
              mux_sig_b      => sig_mux_alu_b
    );
    
  harzard_detection_unit: hazard_detection_unit
    port map ( 
		   EX_memread         => sig_mem_to_reg_to_ppl_ex_mem,
		   EX_write_reg       => sig_write_reg_to_ppl_ex_mem,
		   ID_reg_a           => sig_insn(12 downto 9),
		   ID_reg_b           => sig_insn(8 downto 5),
		   stall              => sig_stall,
		   branch => sig_branch,
		   opcode             => sig_opcode_input,
		   if_flush           => sig_flush,
		   flush_id_ex => sig_flush_id_ex_inter
           );  

  my_mux_alu_a : mux_3to1_16b
      port map( mux_select => sig_mux_alu_a,
                data_a     => sig_read_data_a,
                data_b     => sig_write_data,
                data_c     => sig_alu_result_to_ppl_mem_wb,
                data_out   => sig_alu_a_in
    );

  my_mux_alu_b : mux_3to1_16b
      port map( mux_select => sig_mux_alu_b,
                data_a     => sig_read_data_b_to_ppl_ex_mem,
                data_b     => sig_write_data,
                data_c     => sig_alu_result_to_ppl_mem_wb,
                data_out   => sig_alu_b_in
    );



end structural;
