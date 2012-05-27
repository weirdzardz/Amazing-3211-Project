---------------------------------------------------------------------------
-- hazard_detection_unit.vhd - Control Unit Implementation
--
-- Notes: refer to headers in single_cycle_core.vhd for the supported ISA.
--
--  control signals:
--     stall: true if we are inserting a nop into pipeline.
--
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hazard_detection_unit is
    port ( 
		   EX_memread         : in std_logic;
		   EX_write_reg       : in std_logic_vector(3 downto 0);
		   ID_reg_a           : in std_logic_vector(3 downto 0);
		   ID_reg_b           : in std_logic_vector(3 downto 0);
		   stall              : out std_logic;
		   opcode             : in  std_logic_vector(2 downto 0);
		   branch             : in std_logic;
		   if_flush           : out std_logic;
		   flush_id_ex        : out std_logic
           );  
end hazard_detection_unit;


architecture behavioural of hazard_detection_unit is
signal sig_stall : std_logic := '0';
signal sig_flush : std_logic := '0';
signal sig_flush_id_ex : std_logic := '0';
constant OP_BNE   : std_logic_vector(2 downto 0) := "100"; 


begin

 sig_flush <= '1' when branch = '1' else
                  '0';

process(EX_write_reg, EX_memread, ID_reg_a, ID_reg_b) is
  begin
    sig_stall <= '0';
    sig_flush_id_ex <= '0';
  
 if(EX_memread = '1' ) then
        if (EX_write_reg = ID_reg_a) then sig_stall <= '1'; sig_flush_id_ex <= '1';
        elsif (EX_write_reg = ID_reg_b) then sig_stall <= '1'; sig_flush_id_ex <='1';
        end if;
       
 end if;     
end process;

stall <= sig_stall after 1.5 ns;  
if_flush <= sig_flush after 1.5 ns;  
flush_id_ex <= sig_flush_id_ex after 1.5 ns;        
end behavioural;