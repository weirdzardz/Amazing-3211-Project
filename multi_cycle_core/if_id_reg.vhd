----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:20 05/08/2012 
-- Design Name: 
-- Module Name:    if_id_reg - Behavioral 
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

entity if_id_reg is
    port( reset         : in std_logic;
          clk           : in std_logic;
          write_enable  : in std_logic; --NEW ENABLE SIG
          flush         : in std_logic; --NEW FLUSH SIG
          instruction_in   : in std_logic_vector(15 downto 0);
          instruction_out : out std_logic_vector(15 downto 0)  
    );
  
end if_id_reg;

architecture Behavioral of if_id_reg is

signal var_regfile : std_logic_vector(15 downto 0);

begin
  
  reg_process: process (reset, clk, instruction_in, write_enable) is 
  
  begin 
    
  if (reset = '1') then
    var_regfile <=  X"0000";
  
  elsif (rising_edge(clk)) then 
    if (flush = '1') then
    var_regfile <=  X"0000";
    
    elsif  (write_enable = '0') then
    var_regfile <= instruction_in;
  end if;
  end if;
  
  
end process;
instruction_out <= var_regfile after 250 ps;
end Behavioral;
