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
    mem_process: process (
                           addr_in ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
  
    begin
        if (reset = '1') then

            -- inst : op | rs | rt | (rd or offset)


            -- load : 1 - "001"
            -- store : 3 - "011"
            -- add : 0   - "000"
            -- addi : 5  - "101"  --new instruction
            -- bne : 4   - "100"
            -- sub : 6   - "110"
       
--REGISTER MAPPING       
-- R0  -> '0'
-- R1  -> i
-- R2  -> j
-- R3  -> k
-- R4  -> temp4
-- R5  -> jN
-- R6  -> N
-- R7  -> memA
-- R8  -> memB
-- R9  -> memC
-- R10 -> indexA
-- R11 -> indexB
-- R12 -> indexC
-- R13 -> temp1
-- R14 -> temp2
-- R15 -> temp3


--init to 0
            
-- R10 -> indexA
-- R11 -> indexB
-- R12 -> indexC
-- R13 -> temp1
-- R14 -> temp2
-- R15 -> temp3


--init to 0
       
var_insn_mem(0) := "0010000011000000";   --LOAD N, r0					 	
var_insn_mem(1) := "1010000011100001";   --ADDI memA, r0, 1
var_insn_mem(2) := "0001101011001101";   --ADD temp1, temp1, N
var_insn_mem(3) := "1011110111000001";   --ADDI temp2, temp2, 1
var_insn_mem(4) := "1001110011000010";   --BNE temp2, N, 2
var_insn_mem(5) := "0000111110101000";   --ADD memB, memA, temp1
var_insn_mem(6) := "0001000110101001";   --ADD memC, memB, temp1
var_insn_mem(7) := "0000101001101010";   --ADD indexA, iN, k 			#find address A
var_insn_mem(8) := "0001010011101010";   --ADD indexA, indexA, memA
var_insn_mem(9) := "0000100001001011";   --ADD indexB, kN, j 			#find address B
var_insn_mem(10) := "0001011100001011";   --ADD indexB, indexB, memB
var_insn_mem(11) := "0000101001001100";   --ADD indexC, iN, j 			#find address C
var_insn_mem(12) := "0001100100101100";   --ADD indexC, indexC, memC
var_insn_mem(13) := "0011010110100000";   --LOAD temp1, indexA 			#load value A from memory
var_insn_mem(14) := "0011011111000000";   --LOAD temp2, indexB 			#load value B form memory
var_insn_mem(15) := "1101101111001101";   --SUB temp1, temp1, temp2 	#subtract
var_insn_mem(16) := "0001111110101111";   --ADD temp3, temp3, temp1 	#accumulate (sum) C value  
var_insn_mem(17) := "1010011001100001";   --ADDI k, k, 1
var_insn_mem(18) := "0000100011000100";   --ADD kN, kN, N
var_insn_mem(19) := "1000011011000111";   --BNE k, N, 7
var_insn_mem(20) := "0111100111100000";   --STORE temp3, indexC 	#store into C
var_insn_mem(21) := "0000000000001111";   --ADD temp3, r0, r0 		#temp3 cleared
var_insn_mem(22) := "0000000000000011";   --ADD k, r0, r0 			#k cleared
var_insn_mem(23) := "0000000000000100";   --ADD kN, r0, r0 			#kN cleared
var_insn_mem(24) := "1010010001000001";   --ADDI j, j, 1			#inc J
var_insn_mem(25) := "1000010011000111";   --BNE j, N, 7
var_insn_mem(26) := "0000000000000010";   --ADD j, r0, r0
var_insn_mem(27) := "1010001000100001";   --ADDI i, i, 1
var_insn_mem(28) := "0000101011000101";   --ADD iN, iN, N
var_insn_mem(29) := "1000001011000111";   --BNE i, N, 7
var_insn_mem(30) := "0000000000000001";   --ADD i, r0, r0
var_insn_mem(31) := "0000000000000101";   --ADD iN, r0, r0	 


           

        else
            -- read instructions on the rising clock edge
            var_addr := conv_integer(addr_in);
            insn_out <= var_insn_mem(var_addr) after 1.5 ns;
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;
  
end behavioral;