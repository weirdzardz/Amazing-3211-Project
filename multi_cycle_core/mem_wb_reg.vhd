----------------------------------------------------------------------------------
-- MEM/WB Pipeline Register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_wb_reg is
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
end mem_wb_reg;

architecture Behavioral of mem_wb_reg is

begin
  
  reg_process: process (reset, clk) is 
  
  begin 
    
  if (reset = '1') then
    mem_to_reg_out <= '0' after 250 ps;
    write_reg_out <= X"0" after 250 ps;
    reg_write_out <= '0' after 250 ps;
    alu_result_out <= X"0000" after 250 ps;
    data_mem_out <= X"0000" after 250 ps;
  elsif (rising_edge(clk)  ) then 
    mem_to_reg_out <= mem_to_reg_in after 250 ps;
    write_reg_out <= write_reg_in after 250 ps;
    reg_write_out <= reg_write_in after 250 ps;
    alu_result_out <= alu_result_in after 250 ps;
    data_mem_out <= data_mem_in after 250 ps;
  end if;
  
end process;

end Behavioral;

