----------------------------------------------------------------------------------
-- IF/ID Pipeline Register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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

begin
  
  reg_process: process (reset, clk) is 
  
  begin 
            
  if (reset = '1') then
    instruction_out <= X"0000" after 250 ps;   
  elsif (rising_edge(clk) AND write_enable = '0' ) then 
     
    if(flush = '1' ) then
       instruction_out <= X"0000" after 250 ps;
     else
      instruction_out <= instruction_in after 250 ps;
  end if;
 end if;
 
  
  
end process;
end Behavioral;

