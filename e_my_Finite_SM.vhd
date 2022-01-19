library ieee;
use ieee.std_logic_1164.all;


entity e_my_finite_SM is 
   port (   clk             :in    std_logic;
            reset   			 : in   std_logic;
				switch_input    :in    std_logic_vector(9 downto 0);
				push_btn_input  : in   std_logic_vector(3 downto 0);
            output_state    :out   std_logic_vector(3 downto 0)
				);
end entity e_my_finite_SM;

architecture a_my_finite_SM of e_my_finite_SM is

---- Declaration Part -----------------------------------------------

-- Signal Declarations
   

-- Type Declarations
   type t_fsm_states is (state_0,state_1,state_2,state_3,State_4,State_5,State_6);
   signal slv_fsm_state : t_fsm_states;
   signal slv_switch_0 : std_logic_vector (3 downto 0);
	signal slv_switch_1 : std_logic_vector (3 downto 0);
	signal slv_switch_2 : std_logic_vector (3 downto 0);
	signal slv_switch_3 : std_logic_vector (3 downto 0);
---- Synthesis Attribute Declarations
--	attribute syn_encoding: string;
--	attribute syn_encoding of t_fsm_states : type is "0000 0001 0010 0011 0100 0101 0110 0111 1000";
	signal pattern_0,pattern_1,pattern_2,pattern_3 : std_logic_vector(3 downto 0);

begin

---- Assignment Part ------------------------------------------------

-- Concurrent Assignments:

 
      
   finite_state_Machine_transition: process (clk,switch_input,push_btn_input) -- state table
   begin
		if (rising_edge (clk)) then 
      case slv_fsm_state is
			when State_0 =>	if (reset = '0') and (switch_input /= "0000000000") then 
								slv_fsm_state <= State_1;
							end if;
			
         when State_1 =>	if (reset = '0') and ( switch_input /= "0000000000") then 
								slv_fsm_state <= State_2;
						--	else 
							--	slv_fsm_state <= S_0;
                     end if;
         when State_2 =>	if (reset = '0') and ( switch_input /= "0000000000") then
								slv_fsm_state <= State_3; 
                     ---else
								--slv_fsm_state <= S_0;
                     end if;
         when State_3 =>	if (reset = '0') and ( switch_input /= "0000000000") then
								slv_fsm_state <= State_4; 
                     --else	
								--slv_fsm_state <= S_0;
                     end if;
         when State_4 =>	if (reset = '0') and (switch_input /= "0000000000") then
								slv_fsm_state <= State_5; 
								
							end if;
			
         when State_5 =>	if (reset = '0') and (push_btn_input /= "0000") then
								slv_fsm_state <= State_6; 
								
							end if;
			 when State_6 => if(reset = '0') then
								slv_fsm_state <= State_6; 
								end if;
			            --else
								--slv_fsm_state <= S_0;
                     
         
         when others   => slv_fsm_state <= State_0;
      end case;
		end if;
   end process finite_state_Machine_transition; -- state_table

   

   set_state_out: process (slv_fsm_state) -- drive the red LEDs for each state
   begin
      case slv_fsm_state IS
         when State_0 =>   output_state(3 downto 0) <= "0000";
         when State_1 =>   output_state(3 downto 0) <= "0001";
         when State_2 =>   output_state(3 downto 0) <= "0010";
         when State_3 =>   output_state(3 downto 0) <= "0011";
         when State_4 =>   output_state(3 downto 0) <= "0100";
			when State_5 =>   output_state(3 downto 0) <= "0101";
			when State_6 =>   output_state(3 downto 0) <= "0110";
			
         end case;
   end process set_state_out; -- LEDs

end architecture a_my_Finite_sm;