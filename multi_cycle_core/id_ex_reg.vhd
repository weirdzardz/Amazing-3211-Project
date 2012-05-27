----------------------------------------------------------------------------------
-- ID/EX Pipeline Register
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity id_ex_reg is
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
      offset_out : out std_logic_vector(4 downto 0);
      flush         : in std_logic --NEW FLUSH SIG
      
);
  
end id_ex_reg;

architecture Behavioral of id_ex_reg is
  
begin
  
  reg_process: process (reset, clk) is 
  
  begin 
    
  if (reset = '1') then 
    alu_ctl_out <= "00" after 250 ps;
    mem_write_out <= '0' after 250 ps;
    mem_to_reg_out <= '0' after 250 ps;
    reg_s_out <= X"0" after 250 ps;
    reg_t_out <= X"0" after 250 ps;
    write_reg_out <= X"0" after 250 ps;
    reg_write_out <= '0' after 250 ps;
    read_a_out <= X"0000" after 250 ps;
    read_b_out <= X"0000" after 250 ps;
    read_b_nomux_out <= X"0000" after 250 ps;
    offset_out <= "00000" after 250 ps;
  elsif (rising_edge(clk)  ) then 
    
    if ( flush = '1') then
    alu_ctl_out <= "00" after 250 ps;
    mem_write_out <= '0' after 250 ps;
    mem_to_reg_out <= '0' after 250 ps;
    reg_s_out <= X"0" after 250 ps;
    reg_t_out <= X"0" after 250 ps;
    write_reg_out <= X"0" after 250 ps;
    reg_write_out <= '0' after 250 ps;
    read_a_out <= X"0000" after 250 ps;
    read_b_out <= X"0000" after 250 ps;
    read_b_nomux_out <= X"0000" after 250 ps;
    offset_out <= "00000" after 250 ps;
  else
    alu_ctl_out <= alu_ctl_in after 250 ps;
    mem_write_out <= mem_write_in after 250 ps;
    mem_to_reg_out <= mem_to_reg_in after 250 ps;
    reg_s_out <= reg_s_in after 250 ps;
    reg_t_out <= reg_t_in after 250 ps;
    write_reg_out <= write_reg_in after 250 ps;
    reg_write_out <= reg_write_in after 250 ps;
    read_a_out <= read_a_in after 250 ps;
    read_b_out <= read_b_in after 250 ps;
    read_b_nomux_out <= read_b_nomux_in after 250 ps;
    offset_out <= offset_in after 250 ps;
end if;

  end if; 
end process;

end Behavioral;

