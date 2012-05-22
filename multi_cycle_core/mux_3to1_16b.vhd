-- mux_3to1_16b



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_3to1_16b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_c     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
end mux_3to1_16b;

architecture structural of mux_3to1_16b is

component mux_3to1_1b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic;
           data_b     : in  std_logic;
           data_c     : in  std_logic;
           data_out   : out std_logic );
end component;

begin

    -- this for-generate-loop replicates 16 single-bit 2-to-1 mux
    muxes : for i in 15 downto 0 generate
        bit_mux : mux_3to1_1b 
        port map ( mux_select => mux_select,
                   data_a     => data_a(i),
                   data_b     => data_b(i),
                   data_c     => data_c(i),
                   data_out   => data_out(i) );
    end generate muxes;
    
end structural;