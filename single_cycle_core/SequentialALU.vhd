-----------------------------------------------------------------------
---- Simulation Tutorial
----
---- Description: Sequential Adder - Adds two numbers accepted on two
----              different cycles.
----
---- Author: Victor Lai, Lingkan Gong
----
---- Date: 13/02/2011
----
----
-------------------------------------------------------------------------

library IEEE;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SequentialALU is
    port(
        clk          : in  std_logic;
        rst          : in  std_logic;
        x_y          : in  std_logic_vector(15 downto 0);
        sum          : out std_logic_vector(15 downto 0);
        cout         : out std_logic;
        valid        : out std_logic;
        req_n        : in  std_logic;
        ack_n        : out std_logic
    );

end SequentialALU;

architecture rtl of SequentialALU is

    -- state_t is a new data type: the state of the fsm
    type   state_t       is (REQ, ACK, ACCEPT_X, ACCEPT_Y, ADD, RESULT);
    signal state         : state_t:= REQ; -- current state
    signal nstate        : state_t;       -- next state

    signal x_reg         : std_logic_vector(15 downto 0) := (others => '0');
    signal y_reg         : std_logic_vector(15 downto 0) := (others => '0');
    signal x_reg_wr_en   : std_logic;
    signal y_reg_wr_en   : std_logic;

    signal adder_sum     : std_logic_vector(15 downto 0);
    signal adder_cout    : std_logic;
    signal cs_reg        : std_logic_vector(16 downto 0):= (others => '0');
    signal cs_reg_wr_en  : std_logic;

    component alu is
        port (  alucontrol: in std_logic_vector(1 downto 0); 
                src_a     : in  std_logic_vector(15 downto 0);
                src_b     : in  std_logic_vector(15 downto 0);
                res       : out std_logic_vector(15 downto 0);
                zero      : out std_logic ); --TRUE if subtraction led to 0
    end component;

begin

    -- 3 registers in the datapath: x_reg, y_reg, cs_reg
    -- each register is controled by its ??_reg_wr_en signal
    proc_3_reg: process(clk, rst) begin
        if (rst = '1') then
            x_reg <= (others => '0');
            y_reg <= (others => '0');
            cs_reg <= (others => '0');
        elsif (clk'event and clk = '1') then

            if (x_reg_wr_en = '1') then x_reg <= x_y; end if;
            if (y_reg_wr_en = '1') then y_reg <= x_y; end if;
            
            -- note. cs_reg output a default zero when data not valid
            if (cs_reg_wr_en = '1') then
                cs_reg <= adder_cout & adder_sum;
            else
                cs_reg <= (others => '0');
            end if;

        end If;

    end process;

    -- fsm: seq & comb process
    proc_fsm_seq: process(clk, rst) begin
        if (rst = '1') then
            state <= REQ;
        elsif (clk'event and clk = '1') then
            state <= nstate;
        end if;

    end process;

    proc_fsm_comb: process(state, req_n) begin

        -- set default signal values
        ack_n        <= '1';
        valid        <= '0';
        nstate       <= state; -- by default, remain in the current state
        x_reg_wr_en  <= '0';
        y_reg_wr_en  <= '0';
        cs_reg_wr_en <= '0';

        case (state) is
            when REQ =>
                if (req_n = '0') then -- wait for req_n to assert
                    nstate <= ACK;
                end if;
            when ACK =>
                if (req_n = '0') then
                    ack_n <= '0'; -- give back ack then start adding
                    nstate <= ACCEPT_X;
                else
                    nstate <= REQ;
                end if;
            when ACCEPT_X =>
                x_reg_wr_en <= '1'; -- latch x
                nstate <= ACCEPT_Y;
            when ACCEPT_Y =>
                y_reg_wr_en <= '1'; -- latch y
                -- !!!!this error has been corrected!!!!
                -- cs_reg_wr_en <= '1'; 
                nstate <= ADD;
            when ADD =>
                -- !!!!this error has been corrected!!!!
                cs_reg_wr_en <= '1'; 
                nstate <= RESULT;
            when RESULT =>
                valid <= '1'; -- send results (sum & carry) back
                nstate <= REQ;
            when others =>
                nstate <= REQ;
        end case;

    end process;

    -- instantiate the "real" adder
    i_alu: alu
            port map(
            alucontrol     => alucontrol,
            src_a      => x_reg,
            src_b      => y_reg,
            res      => adder_sum,
            zero     => adder_cout
        );
    

       --     x     => x_reg,
      --      y     => y_reg,
       --     sum   => adder_sum,
       --     cout  => adder_cout
    cout <= cs_reg(16);
    sum  <= cs_reg(15 downto 0);

end rtl;