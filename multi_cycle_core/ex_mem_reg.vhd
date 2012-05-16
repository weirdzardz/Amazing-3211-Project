----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:07 05/08/2012 
-- Design Name: 
-- Module Name:    ex_mem_reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex_mem_reg is
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
      alu_zero_in     : in std_logic;
      alu_zero_out    : out std_logic;         
      alu_result_in  : in std_logic_vector(15 downto 0);
      alu_result_out : out std_logic_vector(15 downto 0)  
);
end ex_mem_reg;

architecture Behavioral of ex_mem_reg is

  signal mem_write  : std_logic;
  signal mem_to_reg : std_logic;
  signal write_reg  : std_logic_vector(3 downto 0);
  signal reg_write  : std_logic;
  signal data_b     : std_logic_vector(15 downto 0);
  signal alu_zero   : std_logic;
  signal alu_result : std_logic_vector(15 downto 0);
  
begin
  
  reg_process: process (reset, clk, mem_write_in, mem_to_reg_in, write_reg_in, reg_write_in, data_b_in, alu_zero_in, alu_result_in) is 
  
  begin 
    
  if (reset = '1') then
    mem_write <= '0';
    mem_to_reg <= '0';
    write_reg <= X"0";
    reg_write <= '0';
    data_b <= X"0000";
    alu_zero <= '0';
    alu_result <= X"0000";
    
  elsif (rising_edge(clk)  ) then 
    mem_write <= mem_write_in;
    mem_to_reg <= mem_to_reg_in;
    write_reg <= write_reg_in;
    reg_write <= reg_write_in;
    data_b <= data_b_in;
    alu_zero <= alu_zero_in;
    alu_result <= alu_result_in;
  end if;
  

  
  
end process;
  mem_write_out <= mem_write after 250 ps;
  mem_to_reg_out <= mem_to_reg after 250 ps;
  write_reg_out <= write_reg after 250 ps;
  reg_write_out <= reg_write after 250 ps;
  data_b_out <= data_b after 250 ps;
  alu_zero_out <= alu_zero after 250 ps;
  alu_result_out <= alu_result after 250 ps;
end Behavioral;

