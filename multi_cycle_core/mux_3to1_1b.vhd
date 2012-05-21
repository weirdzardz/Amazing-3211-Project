-- mux_3to1_1b


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_3to1_1b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic;
           data_b     : in  std_logic;
           data_c     : in  std_logic;
           data_out   : out std_logic );
end mux_3to1_1b;

architecture behavioural of mux_3to1_1b is
begin
   -- wait for 1 ns;
    data_out <= data_a after 0.5 ns when (mux_select(1) = '0' AND mux_select(0) = '0') else
                data_b after 0.5 ns when (mux_select(1) = '0' AND mux_select(0) = '1') else
                data_c after 0.5 ns when (mux_select(1) = '1' AND mux_select(0) = '0') else
                'X'  after 0.5 ns ;

end behavioural; 