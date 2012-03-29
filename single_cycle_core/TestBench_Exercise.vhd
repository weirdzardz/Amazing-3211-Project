-------------------------------------------------------------------------
---- Simulation Tutorial
----
---- Description: Top Level TestBench combining Procedures and File IO
----
---- Author: Lingkan Gong
----
---- Date: 23/02/2011
----
----
-------------------------------------------------------------------------

library IEEE;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity TestBench is
    -- no portmap, no IO
end TestBench;

architecture TBusingMixed of TestBench is

    signal clk           : std_logic:= '0'; -- initial value of clock
    signal rst           : std_logic:= '1'; -- initial value of reset

    signal x_y           : std_logic_vector(3 downto 0);
    signal sum           : std_logic_vector(3 downto 0);
    signal cout          : std_logic;
    signal valid         : std_logic;
    signal req_n         : std_logic;
    signal ack_n         : std_logic;

    signal pass_or_fail  : std_logic;

    component SequentialAdder is
        port(
            clk          : in  std_logic;
            rst          : in  std_logic;
            x_y          : in  std_logic_vector(3 downto 0);
            sum          : out std_logic_vector(3 downto 0);
            cout         : out std_logic;
            valid        : out std_logic;
            req_n        : in  std_logic;
            ack_n        : out std_logic
        );
    end component;

    --------------------------------------------
    -- procedure to print info on the screen
    --------------------------------------------
    file stdout : text open write_mode is "STD_OUTPUT";
    
    procedure print_info(
        info                       : in string;
        constant expected,actual   : in std_logic_vector(3 downto 0)
    ) is
        variable info_buff : line;
    begin
        write(info_buff,  info);
        
        hwrite(info_buff, expected);
        hwrite(info_buff, actual);
        
        writeline(stdout, info_buff);
    end;

    --------------------------------------------
    -- stimuli and expected results file
    --------------------------------------------
    file stimuli_file : text open read_mode is "stimuli.txt";
    file results_file : text open read_mode is "expected_results.txt";
    
    --------------------------------------------
    -- procedure to drive the sequential adder
    --------------------------------------------
    procedure drive_adder(
        constant x,y               : in  std_logic_vector(3 downto 0);
        signal   x_y               : out std_logic_vector(3 downto 0);
        signal   clk               : in  std_logic;
        signal   req_n             : out std_logic;
        signal   ack_n             : in  std_logic;
        signal   valid             : in  std_logic
    ) is begin

        -- clean up all the signals
        req_n <= '1';
        x_y   <= (others => '0');
        
        -- generate handshake waveform and drive the DUT
        wait until clk'event and clk = '1';
        req_n <= '0';
        wait until clk'event and clk = '1' and ack_n = '0';
        req_n <= '1';
        x_y   <= x;
        wait until clk'event and clk = '1';
        x_y   <= y;
        
        -- !!!! important, should wait until the DUT has finished
        -- !!!! before returning to the caller
        wait until clk'event and clk = '1'and valid = '1';
        
        -- clean up all the signals
        req_n <= '1';
        x_y   <= (others => '0');

    end procedure drive_adder;

    --------------------------------------------
    -- procedure to check the sequential adder
    --------------------------------------------
    procedure check_adder(
        constant cout_ref          : in  std_logic;
        constant sum_ref           : in  std_logic_vector(3 downto 0);
        signal   cout              : in  std_logic;
        signal   sum               : in  std_logic_vector(3 downto 0);
        signal   clk               : in  std_logic;
        signal   valid             : in  std_logic;
        signal   pass_or_fail      : out std_logic
    ) is begin
        
        pass_or_fail <= '0'; -- pass
        
        -- !!!! important, should wait until the DUT has finished
        -- !!!! before comparing the results
        wait until clk'event and clk = '1'and valid = '1';
        
        if (cout /= cout_ref) then
            pass_or_fail <= '1'; -- fail
            print_info("[error] cout fails", conv_std_logic_vector(cout_ref, 4), "000" & cout); 
        end if;

        if (sum /= sum_ref) then
            pass_or_fail <= '1'; -- fail
            print_info("[error] sum fails", sum_ref, sum); 
        end if;
        
    end procedure check_adder;
    
begin

    --------------------------------------------
    -- clock and reset
    --------------------------------------------
    clk <= not clk after 10 ns;
    rst <= '0' after 25 ns;
    
    --------------------------------------------
    -- stimuli generation
    --------------------------------------------
    stimuli_gen_fileio: process
       variable x_buf    : std_logic_vector(3 downto 0);
       variable y_buf    : std_logic_vector(3 downto 0);
       variable line_buf : line;
    begin
        -- wait for reset and clock signals
        if rst = '1' then
            wait until rst = '0';
        end if;
        wait until clk'event and clk = '1';

        -- read and drive 
        if not endfile(stimuli_file) then

            -- read from file
            readline(stimuli_file, line_buf);
            hread(line_buf, x_buf);
            hread(line_buf, y_buf);

            -- drive the DUT
            drive_adder(x_buf, y_buf, x_y, clk, req_n, ack_n, valid);
            
        end if;

    end process;
    
    --------------------------------------------
    -- results checking
    --------------------------------------------
    results_chk_fileio: process
       variable cout_buf : std_logic_vector(3 downto 0);
       variable sum_buf  : std_logic_vector(3 downto 0);
       variable line_buf : line;
    begin
        -- wait for reset and clock signals
        if rst = '1' then
            wait until rst = '0';
        end if;
        wait until clk'event and clk = '1';

        -- read and check 
        if not endfile(results_file) then

            -- read from file
            readline(results_file, line_buf);
            hread(line_buf, cout_buf);
            hread(line_buf, sum_buf);

            -- check the DUT
            check_adder(cout_buf(0), sum_buf, cout, sum, clk, valid, pass_or_fail);
            
        end if;

    end process;

    --------------------------------------------
    -- instantiate the dut
    --     the inputs of the sequential adder comes from the procedure
    --------------------------------------------
    i_dut: SequentialAdder
        port map(
            clk      => clk,
            rst      => rst,
            x_y      => x_y,
            sum      => sum,
            cout     => cout,
            valid    => valid,
            req_n    => req_n,
            ack_n    => ack_n
        );

End TBusingMixed;
