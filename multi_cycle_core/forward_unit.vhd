-- Forwarding Unit


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity forward_unit is
    port( reg_write_ex_mem : in std_logic;
          reg_write_mem_wb : in std_logic;
          reg_d_ex_mem   : in std_logic_vector(3 downto 0);
          reg_d_mem_wb   : in std_logic_vector(3 downto 0);
          reg_s_id_ex     : in std_logic_vector(3 downto 0);
          reg_t_id_ex     : in std_logic_vector(3 downto 0);
          mux_sig_a      : out std_logic_vector(1 downto 0);
          mux_sig_b      : out std_logic_vector (1 downto 0)
    );
  
end forward_unit;

architecture structural of forward_unit is
  
  signal sig_is_rd_ex_mem_not_zero : std_logic;
  signal sig_is_rd_mem_wb_not_zero : std_logic;
  signal sig_is_rd_ex_mem_eq_rs_id_ex : std_logic;
  signal sig_is_rd_ex_mem_eq_rt_id_ex : std_logic;
  signal sig_is_rd_mem_wb_eq_rs_id_ex : std_logic;
  signal sig_is_rd_mem_wb_eq_rt_id_ex : std_logic;
  -- mux_data = 00 -> from regfile
  -- mex_data = 01 -> from mem
  -- mux_data = 10 -> from alu

  begin
  sig_is_rd_ex_mem_not_zero <= (reg_d_ex_mem(3) OR reg_d_ex_mem(2) OR reg_d_ex_mem(1) OR reg_d_ex_mem(0));
  sig_is_rd_ex_mem_eq_rs_id_ex <= (reg_d_ex_mem(3) XNOR reg_s_id_ex(3)) AND (reg_d_ex_mem(2) XNOR reg_s_id_ex(2)) AND (reg_d_ex_mem(1) XNOR reg_s_id_ex(1)) AND (reg_d_ex_mem(0) XNOR reg_s_id_ex(0));
  sig_is_rd_ex_mem_eq_rt_id_ex <= (reg_d_ex_mem(3) XNOR reg_t_id_ex(3)) AND (reg_d_ex_mem(2) XNOR reg_t_id_ex(2)) AND (reg_d_ex_mem(1) XNOR reg_t_id_ex(1)) AND (reg_d_ex_mem(0) XNOR reg_t_id_ex(0));
 
 -- IF EX/MEM.RegWrite AND EX/MEM.RegisterRd != 0 AND EX/MEM.RegisterRd = ID/EX.RegisterRs forward ALU result to first ALU op
  mux_sig_a(1) <= reg_write_ex_mem AND sig_is_rd_ex_mem_not_zero AND sig_is_rd_ex_mem_eq_rs_id_ex;
  
  --IF EX/MEM.RegWrite AND EX/MEM.RegisterRd != 0 AND EX/MEM.RegisterRd = ID/EX.RegisterRt forward ALU result to second ALU op    
  mux_sig_b(1) <= reg_write_ex_mem AND sig_is_rd_ex_mem_not_zero AND sig_is_rd_ex_mem_eq_rt_id_ex;
  
  sig_is_rd_mem_wb_not_zero <= (reg_d_mem_wb(3) OR reg_d_mem_wb(2) OR reg_d_mem_wb(1) OR reg_d_mem_wb(0));
  sig_is_rd_mem_wb_eq_rs_id_ex <= (reg_d_mem_wb(3) XNOR reg_s_id_ex(3)) AND (reg_d_mem_wb(2) XNOR reg_s_id_ex(2)) AND (reg_d_mem_wb(1) XNOR reg_s_id_ex(1)) AND (reg_d_mem_wb(0) XNOR reg_s_id_ex(0));
  sig_is_rd_mem_wb_eq_rt_id_ex <= (reg_d_mem_wb(3) XNOR reg_t_id_ex(3)) AND (reg_d_mem_wb(2) XNOR reg_t_id_ex(2)) AND (reg_d_mem_wb(1) XNOR reg_t_id_ex(1)) AND (reg_d_mem_wb(0) XNOR reg_t_id_ex(0));

  
  --IF MEM/WB.RegWrite AND MEM/WB.RegisterRd != 0 AND EX/MEM.RegisterRd != ID/EX.RegisterRs
  --AND MEM/WB.RegisterRd = ID/EX.RegisterRs forward MEM data to first ALU op
  mux_sig_a(0) <= reg_write_mem_wb AND sig_is_rd_mem_wb_not_zero AND (NOT sig_is_rd_ex_mem_eq_rs_id_ex) AND sig_is_rd_mem_wb_eq_rs_id_ex;
 
  --IF MEM/WB.RegWrite AND MEM/WB.RegisterRd != 0 AND EX/MEM.RegisterRd != ID/EX.RegisterRt
  --AND MEM/WB.RegisterRd = ID/EX.RegisterRt forward MEM data to second ALU op
  mux_sig_b(0) <= reg_write_mem_wb AND sig_is_rd_mem_wb_not_zero AND (NOT sig_is_rd_ex_mem_eq_rt_id_ex) AND sig_is_rd_mem_wb_eq_rt_id_ex; 
  
  
end structural;