	
	----------------------------------------------------------------------------------
-- Company: School of CSE, UNSW
-- Engineer: Jorgen Peddersen
-- 
-- Create Date:    16:09:26 04/12/2012 
-- Design Name:    Processor Wrapper
-- Module Name:    top - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in  STD_LOGIC;
           clk_manual : in  STD_LOGIC;
           clk_sel : in  STD_LOGIC;
           mem_sel : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           par_data : inout  STD_LOGIC_VECTOR (7 downto 0);
           par_dst : in  STD_LOGIC;
           par_ast : in  STD_LOGIC;
           par_wr : in  STD_LOGIC;
           par_wait : out  STD_LOGIC;
			  switches : in STD_LOGIC_VECTOR(5 downto 0);
			  pbs : in  STD_LOGIC_VECTOR(1 downto 0);
			  leds : out STD_LOGIC_VECTOR(7 downto 0));
end top;

architecture Behavioral of top is
	-- Clock signals
	signal debounce_cnt : std_logic_vector(6 downto 0);
	signal clk_debounced : std_logic;
	signal clk_selected, clk_selected_ubuf, clk_mem, clk_mem_ubuf : std_logic;

	-- State machine signals
   type STATE_TYPE is (stIdle, stAckWriteAddr, stAckWriteData, stWriteData, stAckIgnore, stReadData, stAckRead, stIdleCR, stAckCR, stIdleLF, stAckLF);
	signal cs, ns : STATE_TYPE;

	-- PC communication signals
	signal par_data_l : std_logic_vector(7 downto 0);
	signal par_dst_l, par_ast_l, par_wr_l : std_logic;
	signal par_d_act : std_logic;
	
	-- PC address counter
	signal addr_cnt : std_logic_vector(11 downto 0);
	signal addr_cnt_rst, addr_cnt_inc : std_logic;
	
	--PC data buffer
	signal data_buf : std_logic_vector(15 downto 0);
	signal data_buf_sh, data_buf_l : std_logic;
	signal data_decode : std_logic_vector(4 downto 0);
	signal data_ascii, data_out : std_logic_vector(7 downto 0);
	signal data_crlf : std_logic_vector(1 downto 0);
	signal data_we, inst_we : std_logic;

   -- Memory interfaces
	component dmem
	port (
		a: in std_logic_vector(9 downto 0);
		d: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		we: in std_logic;
		spo: out std_logic_vector(15 downto 0));
	end component;

	component imem
	port (
		a: in std_logic_vector(7 downto 0);
		d: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		we: in std_logic;
		spo: out std_logic_vector(15 downto 0));
	end component;

	-- Synplicity black box declaration
	attribute syn_black_box : boolean;
	attribute syn_black_box of imem: component is true;
	attribute syn_black_box of dmem: component is true;

	--Memory signals
	signal mode : std_logic;
	signal mode_set : std_logic;
	signal dmem_a : std_logic_vector(9 downto 0);
	signal imem_a : std_logic_vector(7 downto 0);
	signal dmem_di, dmem_do, imem_di, imem_do : std_logic_vector(15 downto 0);
	signal dmem_we, imem_we : std_logic;
	
   -------------------------------------
	-- Your signals/components start here
	-------------------------------------
   signal im_addr_in : std_logic_vector(7 downto 0);
	signal dm_addr_in : std_logic_vector(9 downto 0);
	signal im_data_out, dm_data_in, dm_data_out : std_logic_vector(15 downto 0);
	signal dm_write_enable : std_logic;
	
	component single_cycle_core
	port (
		clk : in std_logic;
		reset : in std_logic;
		im_addr_in : out std_logic_vector(7 downto 0);
		im_data_out : in std_logic_vector(15 downto 0);
		dm_write_enable : out std_logic;
		dm_addr_in : out std_logic_vector(9 downto 0);
		dm_data_out : in std_logic_vector(15 downto 0);
		dm_data_in : out std_logic_vector(15 downto 0));
	end component;
	
	
	
	-------------------------------------
	-- Your signals/components end here
	-------------------------------------
begin
   -----------------------------    
	-- Your code starts here
	-----------------------------
	i_MATDIFF: single_cycle_core
	port map(
		clk => clk_selected,
		reset => reset,
		im_addr_in => im_addr_in,
		im_data_out => im_data_out,
		dm_write_enable => dm_write_enable,
		dm_addr_in => dm_addr_in,
		dm_data_out => dm_data_out,
		dm_data_in => dm_data_in
	);
	
--	dm_addr_in <= "00000" & switches(4 downto 0); -- comment these lines after instantiating your processor
--	im_addr_in <= "000" & switches(4 downto 0);   -- to avoid reassigning a value to these signals
--	dm_write_enable <= switches(5);               -- ||
--	dm_data_in <= x"1234";                        -- ||
	with pbs select                               -- ||
		leds <=                               -- ||
		im_data_out(7 downto 0) when "00",    -- ||
		dm_data_out(7 downto 0) when "01",    -- ||
		im_data_out(15 downto 8) when "10",   -- ||
		dm_data_out(15 downto 8) when others; -- \/
	
   -----------------------------    
	-- Your code ends here
	-----------------------------
	
	-- Manual Clock Debouncing
	process(clk, reset)
	begin
		if reset = '1' then
			debounce_cnt <= (others => '0');
			clk_debounced <= '1';
		elsif clk'event and clk = '1' then
			if clk_debounced = clk_manual then
				debounce_cnt <= (others => '0');
			else
				debounce_cnt <= debounce_cnt + 1;
				if debounce_cnt = "1111111" then
					clk_debounced <= not clk_debounced;
				end if;	
			end if;
		end if;			
	end process;

	-- Select correct clocks
	clk_mem_ubuf <= clk_debounced when clk_sel = '0' and mem_sel = '1' else clk;
	clk_selected_ubuf <= clk_debounced when clk_sel = '0' else clk;
	
	-- Clock Buffers
	BUFG_clk_sel: BUFG
	port map(
		O => clk_selected,
		I => clk_selected_ubuf
	);
	BUFG_clk_mem: BUFG
	port map(
		O => clk_mem,
		I => clk_mem_ubuf
	);
	
	-- Select correct mem control
	dmem_a <= dm_addr_in when mem_sel = '1' else addr_cnt(11 downto 2);
	dmem_di <= dm_data_in when mem_sel = '1' else data_buf;
	dmem_we <= dm_write_enable when mem_sel = '1' else data_we;
	dm_data_out <= dmem_do; 

	imem_a <= im_addr_in when mem_sel = '1' else addr_cnt(9 downto 2);
	imem_di <= data_buf;
	imem_we <= inst_we;
	im_data_out <= imem_do; 
	
	--Data decoding
	with par_data_l select
		data_decode <=
		"10000" when x"30",
		"10001" when x"31",
		"10010" when x"32",
		"10011" when x"33",
		"10100" when x"34",
		"10101" when x"35",
		"10110" when x"36",
		"10111" when x"37",
		"11000" when x"38",
		"11001" when x"39",
		"11010" when x"41",
		"11011" when x"42",
		"11100" when x"43",
		"11101" when x"44",
		"11110" when x"45",
		"11111" when x"46",
		"0----" when others;
	with data_buf(15 downto 12) select
		data_ascii <=
		x"30" when x"0",
		x"31" when x"1",
		x"32" when x"2",
		x"33" when x"3",
		x"34" when x"4",
		x"35" when x"5",
		x"36" when x"6",
		x"37" when x"7",
		x"38" when x"8",
		x"39" when x"9",
		x"41" when x"A",
		x"42" when x"B",
		x"43" when x"C",
		x"44" when x"D",
		x"45" when x"E",
		x"46" when x"F",
		(others => '-') when others;
	with data_crlf select
		data_out <=
		data_ascii when "00",
		x"0D" when "01",
		x"0A" when "10",
		(others => '-') when others;
		
	--PC communication signals
	par_data <= (others => 'Z') when par_d_act = '0' else data_out;
	
	-- State machine for communication to PC clocked logic
	process(clk_mem, reset)
	begin
		if reset = '1' then
			cs <= stIdle;
			
			par_data_l <= (others => '0');
			par_dst_l <= '0';
			par_ast_l <= '0';
			par_wr_l <= '0';
			
			addr_cnt <= (others => '0');
			
		elsif clk_mem'event and clk_mem = '1' then
			cs <= ns;
			
			par_data_l <= par_data;
			par_ast_l <= par_ast;
			par_dst_l <= par_dst;
			par_wr_l <= par_wr;
			
			if addr_cnt_rst = '1' then
			  addr_cnt <= (others => '0');
			elsif addr_cnt_inc = '1' then
				addr_cnt <= addr_cnt + 1;
			end if;
				
			if data_buf_sh = '1' then
				data_buf <= data_buf(11 downto 0) & data_decode(3 downto 0);
			elsif data_buf_l = '1' and mode = '0' then
				data_buf <= imem_do;
			elsif data_buf_l = '1' then
				data_buf <= dmem_do;
			end if;

			if mode_set = '1' then
				mode <= par_data_l(0);
			end if;
			
		end if;
	end process;
	
	-- State machine for communication output logic
	process(cs, par_ast_l, par_dst_l, par_wr_l, mode, mem_sel, addr_cnt, data_decode)
	begin
		par_wait <= '0';
		par_d_act <= '0';
		
		mode_set <= '0';
		addr_cnt_rst <= '0';
		addr_cnt_inc <= '0';
		data_buf_sh <= '0';
		data_buf_l <= '0';
		
		data_we <= '0';
		inst_we <= '0';
		
		data_crlf <= "00";
		case cs is
			when stIdle => -- Waiting for Address Writes, Data Writes or Data Reads
				if mem_sel = '0' and par_ast_l = '0' and par_wr_l = '0' then
					-- Address Write.  Reset the address counter and set mode based on register.
					ns <= stAckWriteAddr;
					mode_set <= '1';
					addr_cnt_rst <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' and data_decode(4) = '1' then
					-- Data Write of a valid Hex value.  Add it to the buffer.
					ns <= StAckWriteData;
					data_buf_sh <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' then
					-- Data Write of a non-Hex value.  Ignore it.
					ns <= StAckIgnore;	
				elsif mem_sel = '0' and par_dst_l = '0' and addr_cnt(1 downto 0) = "00" then
					-- First Data Read of a memory word.  Read memory first.
					ns <= stReadData;
				elsif mem_sel = '0' and par_dst_l = '0' then
					-- Data Read of subsequent nybbles. Send buffered data.
					ns <= stAckRead;
				else
					ns <= stIdle;
				end if;
			when stAckWriteAddr => -- Wait for handshake to complete
				if par_ast_l = '0' then
					ns <= stAckWriteAddr;
				else
					ns <= stIdle;
				end if;
				par_wait <= '1';
			when stAckWriteData => -- Wait for handshake to complete
				if par_dst_l = '0' then
					ns <= stAckWriteData;
				elsif addr_cnt(1 downto 0) = "11" then
					-- If we have buffered four nybbles, write to memory
					ns <= stWriteData;
				else
					-- Otherwise wait for more
					ns <= stIdle;
					addr_cnt_inc <= '1';
				end if;
				par_wait <= '1';
			when stWriteData => -- Write word to memory
				ns <= stIdle;
				data_we <= mode;
				inst_we <= not mode;
				addr_cnt_inc <= '1';
			when stAckIgnore => -- Wait for handshake to complete
				if par_dst_l = '0' then
					ns <= stAckIgnore;
				else
					ns <= stIdle;
				end if;
				par_wait <= '1';
			when stReadData => -- Read a word from memory
				ns <= stAckRead;
				data_buf_l <= '1';
			when stAckRead => -- Compete handshake whie sending a nybble of the word
				if par_dst_l = '0' then
					ns <= stAckRead;
				elsif addr_cnt(1 downto 0) = "11" then
					-- After sending four nybbles, send a carriage return next
					ns <= stIdleCR;
				else
					-- Otherwise wait for next request
					ns <= stIdle;
				end if;
				par_wait <= '1';
				par_d_act <= '1';
				data_buf_sh <= par_dst_l;
				addr_cnt_inc <= par_dst_l;
			when stIdleCR => -- Special Idle State that will give a CR to Read Data requests
				if mem_sel = '0' and par_ast_l = '0' and par_wr_l = '0' then
					ns <= stAckWriteAddr;
					mode_set <= '1';
					addr_cnt_rst <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' and data_decode(4) = '1' then
					ns <= StAckWriteData;
					data_buf_sh <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' then
					ns <= StAckIgnore;	
				elsif mem_sel = '0' and par_dst_l = '0' then
					ns <= stAckCR;
				else
					ns <= stIdleCR;
				end if;
			when stAckCR => -- Complete handshake while sending a carriage return
				if par_dst_l = '0' then
					ns <= stAckCR;
				else
					-- Send a line feed next
					ns <= stIdleLF;
				end if;
				par_wait <= '1';
				par_d_act <= '1';
				data_crlf <= "01";
			when stIdleLF => -- Special Idle State that will send a LF to Read Data requests
				if mem_sel = '0' and par_ast_l = '0' and par_wr_l = '0' then
					ns <= stAckWriteAddr;
					mode_set <= '1';
					addr_cnt_rst <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' and data_decode(4) = '1' then
					-- Data Write of a valid Hex value.  Add it to the buffer.
					ns <= StAckWriteData;
					data_buf_sh <= '1';
				elsif mem_sel = '0' and par_dst_l = '0' and par_wr_l = '0' then
					-- Data Write of a non-Hex value.  Ignore it.
					ns <= StAckIgnore;	
				elsif mem_sel = '0' and par_dst_l = '0' then
					ns <= stAckLF;
				else
					ns <= stIdleLF;
				end if;
			when stAckLF => -- Complete handshake while sending a Line Feed
				if par_dst_l = '0' then
					ns <= stAckLF;
				else
					ns <= stIdle;
				end if;
				par_wait <= '1';
				par_d_act <= '1';
				data_crlf <= "10";
		end case;
	end process;
	
	-- Memory instantiation
	data_mem : dmem
		port map (
			a => dmem_a,
			d => dmem_di,
			clk => clk_mem,
			we => dmem_we,
			spo => dmem_do);
			
	inst_mem : imem
		port map (
			a => imem_a,
			d => imem_di,
			clk => clk_mem,
			we => imem_we,
			spo => imem_do);
end Behavioral;

