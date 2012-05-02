---------------------------------------------------------------------------
-- instruction_memory.vhd - Implementation of A Single-Port, 16 x 16-bit
--                          Instruction Memory.
-- 
-- Notes: refer to headers in single_cycle_core.vhd for the supported ISA.
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

entity instruction_memory is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(4 downto 0);
           insn_out : out std_logic_vector(15 downto 0) );
end instruction_memory;

architecture behavioral of instruction_memory is

type mem_array is array(0 to 31) of std_logic_vector(15 downto 0);
signal sig_insn_mem : mem_array;

begin
    mem_process: process ( clk,
                           addr_in ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
  
    begin
        if (reset = '1') then

            -- inst : op | rs | rt | (rd or offset)


            -- load : 1 - "001"
            -- store : 3 - "011"
            -- add : 0   - "000"
            -- beq : 4   - "100"
            -- sub : 5   - "110"
       
            -- initial values of the instruction memory :
            --  insn_0 : load  $1, $0, 0   - load data 0($0) into $1
            --  insn_1 : load  $2, $0, 1   - load data 1($0) into $2
            --  insn_2 : add   $3, $0, $1  - $3 <- $0 + $1
            --  insn_3 : add   $4, $1, $2  - $4 <- $1 + $2
            --  insn_4 : store $3, $0, 2   - store data $3 into 2($0)
            --  insn_5 : store $4, $0, 3   - store data $4 into 3($0)
            --  insn_6 : subabs $5, $3, $4
            --  insn_7 : load  $6, $0, 4   - load data 4($0) into $6
            --  insn_8 : add   $7, $6, $7  - $7 <- $6 +$7
            --  insn_9 : beq   $3, $7, D   - jump to insn_13 if $3 == $7
            --  insn_10 : noop
            --  insn_11 : jmp 0, 0, 8      - jump to insn_8
            --  insn_12 - insn_15 : noop    - end of program


            var_insn_mem(0)  := "0010000000100000"; --001 0000 0001 0 0000
            var_insn_mem(1)  := "0010000001000001"; --001 0000 0010 0 0001
            var_insn_mem(2)  := "0000001000000011"; --000 0001 0000 0 0011
            var_insn_mem(3)  := "0000001001000100"; --000 0001 0010 0 0100
            var_insn_mem(4)  := "0110000001100010"; --011 0000 0011 0 0010
            var_insn_mem(5)  := "0110000010000011"; --011 0000 0100 0 0011
            var_insn_mem(6)  := "1100011010000101"; --110 0011 0100 0 0101
            var_insn_mem(7)  := "0010000011000100"; --001 0000 0110 0 0100
            var_insn_mem(8)  := "0000110011100111"; --000 0110 0111 0 0111
            var_insn_mem(9)  := "1000011011101000";  --100 0011 0111 01000
            var_insn_mem(10) := X"0000";
            var_insn_mem(11) := X"0000";
            var_insn_mem(12) := X"0000";
            var_insn_mem(13) := X"0000";
            var_insn_mem(14) := X"0000";
            var_insn_mem(15) := X"0000";
            --the following adresses need to have proper values entered.
            var_insn_mem(16)  := X"0000";
            var_insn_mem(17)  := X"0000";
            var_insn_mem(18)  := X"0000";
            var_insn_mem(19)  := X"0000";
            var_insn_mem(20)  := X"0000";
            var_insn_mem(21)  := X"0000";
            var_insn_mem(22)  := X"0000";
            var_insn_mem(23)  := X"0000";
            var_insn_mem(24)  := X"0000";
            var_insn_mem(25)  := X"0000";
            var_insn_mem(26) := X"0000";
            var_insn_mem(27) := X"0000";
            var_insn_mem(28) := X"0000";
            var_insn_mem(29) := X"0000";
            var_insn_mem(30) := X"0000";
            var_insn_mem(31) := X"0000";
            
        
        elsif (rising_edge(clk)) then
            -- read instructions on the rising clock edge
            var_addr := conv_integer(addr_in);
            insn_out <= var_insn_mem(var_addr) after 1.5 ns;
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;
  
end behavioral;
