library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity e_my_calculator is 
port
	(	
	 clk :in std_logic;
	 LEDR  :out std_logic_vector(9 downto 0);
	 SW :in std_logic_vector(9 downto 0);
	 
	 KEY :in  std_logic_vector(3 downto 0);
	 HEX0 :out std_logic_vector(6 downto 0);	 
	 HEX1 :out std_logic_vector(6 downto 0);	 
	 HEX2 :out std_logic_vector(6 downto 0);	 
	 HEX3 :out std_logic_vector(6 downto 0);
	 HEX4 :out std_logic_vector(6 downto 0);
	 HEX5 :out std_logic_vector(6 downto 0);
	 HEX6 :out std_logic_vector(6 downto 0);
	 	
	 slv_out_unsigned: out std_logic_vector(15 downto 0)
	);
end entity e_my_calculator;

architecture a_my_Calculator of e_my_calculator is

component e_finite_sm is 
   port (   clk             :in    std_logic;
            reset   			 : in   std_logic;
				switch_input    :in    std_logic_vector(9 downto 0);
				push_btn_input  : in   std_logic_vector(3 downto 0);
            output_state    :out   std_logic_vector(3 downto 0)
				);
end component;

component e_flipflop is
	port (enable : in std_logic;
			input	 : in integer;
			Rst	 : in std_logic;
			Clk	 : in std_logic;
			buff 		 : buffer integer);
						
end component;

component e_convert_sw_to_integer is 
   port (  switch_input   : in    std_logic_vector(9 downto 0);
           out_integer      : out   integer
				);
end component ;

component e_combine_int is 
port
	(	
	 slv_x :in integer;
	 slv_y :in integer;	 
	 slv_out_unsigned: out integer

	);
end component;

component e_arithmetic_operations is 
port
	(	
	 CLK   : in std_logic;
	 slv_x :in integer;
	 slv_y :in integer;
	 slv_start_operation : in std_logic;
	 slv_push_btn:in std_logic_vector(3 downto 0);
	 slv_out_unsigned: out integer
	);
end component;

--component e_get_digit_from_int is 
--   port (
--       	clk			 :in    std_logic;
--				input_number :in    integer ;
--				digit1       :out   integer;
--				digit2       :out   integer;
--				digit3       :out   integer
--		);
--end component;

component e_7_seg is 
   port (   
				clk 								:in    std_logic;
				number    			   :in    integer := 0;
				sev_seg_out       :out   std_logic_vector(6 downto 0)

				);
end component;

   signal slv_switch_input : std_logic_vector(9 downto 0);
	signal slv_push_btn_input : std_logic_vector(3 downto 0) := "0000";
	signal enter_button : std_logic;
	signal slv_current_digit_from_switch: integer;
	
	--signal slv_operand_1,operand_2 : integer; 
	
	---fsm signals-- 
	signal slv_clk,slv_reset : std_logic := '0';
	signal slv_current_state : std_logic_vector(3 downto 0);
		
	--flip flop signals:
	signal slv_enable_1,slv_enable_2,slv_enable_3,slv_enable_4,slv_enable_5,slv_enable_6,slv_enable_7,slv_enable_8,slv_enable_9,slv_enable_10 : std_logic := '0';
	signal slv_digit_1, slv_digit_2,slv_digit_3,slv_digit_4: integer := 10;
	
	signal slv_operand_1,slv_operand_2 : integer := 0; 
	signal combined_int_1,combined_int_2: integer := 0;
	signal slv_result: integer;
	
	signal slv_start_operation : std_logic := '0';
	signal r_digit_0, r_digit_1, r_digit_2 : integer; 
	signal slv_r_digit_0, slv_r_digit_1, slv_r_digit_2 : integer;
	signal slv_result_store : integer; 

begin
	slv_clk <= clk;
	slv_switch_input <= SW;
	slv_push_btn_input <= KEY;
	
	finite_state_machine: e_finite_sm port map (slv_clk,slv_reset,slv_switch_input,slv_push_btn_input, slv_current_state);
	convert_digit:  e_convert_sw_to_integer port map (slv_switch_input, slv_current_digit_from_switch); 
	
	combine_digits_1: e_combine_int port map ( slv_digit_1,slv_digit_2 , combined_int_1);
	combine_digits_2: e_combine_int port map ( slv_digit_3,slv_digit_4 , combined_int_2);
	
	flip_flop_1 : e_flipflop port map (slv_enable_1,slv_current_digit_from_switch,slv_reset, slv_clk, slv_digit_1);
	flip_flop_2 : e_flipflop port map (slv_enable_2,slv_current_digit_from_switch,slv_reset, slv_clk, slv_digit_2);	
	flip_flop_3: e_flipflop port map (slv_enable_3,slv_current_digit_from_switch,slv_reset, slv_clk, slv_digit_3);
	flip_flop_4: e_flipflop port map (slv_enable_4,slv_current_digit_from_switch,slv_reset, slv_clk, slv_digit_4);
	flip_flop_5: e_flipflop port map (slv_enable_5,combined_int_1,slv_reset, slv_clk, slv_operand_1);
   flip_flop_6: e_flipflop port map (slv_enable_6,combined_int_2,slv_reset, slv_clk, slv_operand_2);
	flip_flop_7: e_flipflop port map (slv_enable_7,slv_result,slv_reset, slv_clk, slv_result_store);	
	flip_flop_8: e_flipflop port map (slv_enable_8,r_digit_0,slv_reset, slv_clk, slv_r_digit_0);
   flip_flop_9: e_flipflop port map (slv_enable_9,r_digit_1,slv_reset, slv_clk, slv_r_digit_1);
	flip_flop_10: e_flipflop port map (slv_enable_10,r_digit_2,slv_reset, slv_clk, slv_r_digit_2);
	
	HEX_1 : e_7_seg port map (clk,slv_digit_1,HEX0);
	HEX_2 : e_7_seg port map (clk,slv_digit_2,HEX1);
	HEX_3 : e_7_seg port map (clk,slv_digit_3,HEX2);
	HEX_4 : e_7_seg port map (clk,slv_digit_4,HEX3);
	HEX_5 : e_7_seg port map (clk,slv_r_digit_0,HEX4);
	HEX_6 : e_7_seg port map (clk,slv_r_digit_1,HEX5);
	HEX_7 : e_7_seg port map (clk,slv_r_digit_2,HEX6);
		
--	divide_digits: e_get_digit_from_int port map (slv_clk, slv_result, r_digit_0, r_digit_1, r_digit_2);
	operation:  e_arithmetic_operations port map( slv_clk,combined_int_1,combined_int_2,slv_start_operation,slv_push_btn_input,slv_result);	
	main_process: process(clk,slv_current_state,slv_current_digit_from_switch)
	
	begin  
		if ( slv_current_state = "0001") then 
			  if (slv_switch_input = "0000000000" )  then
						slv_enable_1 <= '0';
			   elsif   ((slv_current_digit_from_switch /= 10) and (slv_digit_1 /= slv_current_digit_from_switch)) then
				      slv_enable_1 <= '0';
					
					slv_enable_1  <= '1';
				end if; 
		elsif ( slv_current_state = "0010") then 
			  if (slv_switch_input = "0000000000") then
						slv_enable_2 <= '0';
						
			   else 
					slv_enable_1  <= '0';
					slv_enable_2  <= '1';
				end if; 
		elsif ( slv_current_state = "0011") then 
			  if (slv_switch_input = "0000000000") then
						slv_enable_3 <= '0';
						slv_enable_2  <= '0';
			   else 
					slv_enable_3  <= '1';
					slv_enable_2  <= '0';
				end if; 
		elsif ( slv_current_state = "0100") then 
			  if (slv_switch_input = "0000000000") then
						slv_enable_4 <= '0';
						slv_enable_3  <= '0';
			   else 
					slv_enable_4  <= '1';
					slv_enable_3  <= '0';
				end if; 
		elsif ( slv_current_state = "0101") then 
			  if (slv_push_btn_input= "0000") then
						slv_enable_4 <= '0';	
			   else 
					slv_enable_4  <= '0';
					slv_enable_5  <= '1';
					slv_enable_6  <= '1';
					slv_enable_7  <= '1';
					slv_enable_8  <= '1';
					slv_enable_9  <= '1';
					slv_enable_10  <= '1';
					slv_start_operation <= '1';
				end if; 
		end if;
	end process;

end architecture a_my_calculator;




