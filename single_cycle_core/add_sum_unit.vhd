library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity addsumunit is
    port ( alucontrol: in std_logic_vector(1 downto 0); 
           src_a     : in  std_logic_vector(7 downto 0);
           src_b     : in  std_logic_vector(7 downto 0);
           res       : out std_logic_vector (7 downto 0);
           zero      : out std_logic ); --TRUE if subtraction led to 0
end addsumunit;



architecture structural of addsumunit is

component adder_8b is
    port ( x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
           y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
           c_in      :  IN   STD_LOGIC;
           sum       :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
           c_out     :  OUT  STD_LOGIC;
           prev_cout :  OUT  STD_LOGIC);
end component;



signal sig_result : std_logic_vector(16 downto 0);

signal sig_x_in_1    :    STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";    --input x for adder1
signal sig_y_in_1    :    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";    --input y for adder1
signal sig_x_in_2    :    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";    --input x for adder2
signal sig_y_in_2    :    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";    --input y for adder2
signal sig_subtract  :    STD_LOGIC := '0';                       --TRUE if we perform subtraction
signal sig_cin       :    STD_LOGIC:= '0';
signal sig_overflow  :    STD_LOGIC:= '0';
signal sig_sum1      :    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";
signal sig_sum2      :    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";
signal sig_cout1     :    STD_LOGIC:= '0';  
signal sig_prevcout1:    STD_LOGIC:= '0';  
signal sig_cout2     :    STD_LOGIC:= '0';   
signal sig_prevcout2:    STD_LOGIC:= '0';  
signal sig_add_res:    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";
signal sig_sub_res:    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";
signal overflow_val:    STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";
signal sig_res : std_logic_vector(7 downto 0);


--alucontrol: '01' for add
--alucontrol: '10' for sub
--alucontrol: '11' for beq


begin

  adder1: adder_8b 
    port map ( x_in  => sig_x_in_1,
           y_in     => sig_y_in_1,
           c_in     => sig_cin,
           sum      => sig_sum1,
           c_out    => sig_cout1,
           prev_cout => sig_prevcout1);
  adder2: adder_8b 
    port map ( x_in  => sig_x_in_2,
           y_in     => sig_y_in_2,
           c_in     => sig_cin,
           sum      => sig_sum2,
           c_out    => sig_cout2,
           prev_cout => sig_prevcout2);
  
    myprocess :process (src_a, src_b, alucontrol) is
  
  begin 
    overflow_val <= "01111111";
    sig_subtract <= alucontrol(1);  --TRUE if we perform subtraction
    sig_cin  <= sig_subtract;   --c_in is 1 if subtracting  
    sig_x_in_1 <= src_a(7 downto 0);
    sig_y_in_2 <= src_b(7 downto 0);

--on adder1: change 'y' to '-y' if subtracting
--on adder2: change 'x' to '-x' if 
    case alucontrol(1) is
      when '1' => 
          sig_y_in_1 <= NOT src_b(7 downto 0);
          sig_x_in_2 <= NOT src_a(7 downto 0);
      when others =>
      sig_y_in_1 <= src_b(7 downto 0);
      sig_x_in_2 <= src_a(7 downto 0);
  end case;
                  
    sig_overflow <= (sig_cout1 XOR sig_prevcout1) AND NOT sig_subtract; 
    --we only look for overflow on adder1 because adder2 is only relevant to subtraction
    
    case sig_overflow is
    when '0' => sig_add_res <= sig_sum1;
    when others => sig_add_res <= overflow_val;
  end case;
    case sig_sum1(7) is
    when '0' =>
      sig_sub_res <= sig_sum1;
    when others => sig_sub_res <= sig_sum2;
    end case;
      case sig_subtract is 
      when '0' => sig_res <= sig_add_res;
      when others => sig_res <= sig_sub_res;
end case;
     
  end process;
                            
    res        <= sig_res;
    zero     <= NOT( sig_sub_res(07) OR sig_sub_res(06) OR sig_sub_res(05) OR sig_sub_res(04) OR
                    sig_sub_res(03) OR sig_sub_res(02) OR sig_sub_res(01) OR sig_sub_res(0));
    
end structural;