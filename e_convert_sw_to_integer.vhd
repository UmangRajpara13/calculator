library ieee;
use ieee.std_logic_1164.all;


entity e_convert_sw_to_integer is 
   port (  switch_input   : in    std_logic_vector(9 downto 0);
           out_integer      : out   integer
				);
end entity e_convert_sw_to_integer ;

architecture a_convert_sw_to_integer of e_convert_sw_to_integer is

---- Declaration Part ----

-- Signal Declarations
   
-- Type Declarations
   signal slv_integer : integer; 
	
---- Synthesis Attribute Declarations
	signal pattern_0,pattern_1,pattern_2,pattern_3 : std_logic_vector(3 downto 0);

begin

---- Assignment Part ----

-- Concurrent Assignments:
   out_integer <= slv_integer;
	
	
   select_integer: process (switch_input) -- drive the red LEDs for each state
   begin
      case switch_input IS
			when "0000000001" =>   slv_integer <= 0;
         when "0000000010" =>   slv_integer <= 1;
         when "0000000100" =>   slv_integer <= 2;
         when "0000001000" =>   slv_integer <= 3;
         when "0000010000" =>   slv_integer <= 4;
         when "0000100000" =>   slv_integer <= 5;
			when "0001000000" =>   slv_integer <= 6;
			when "0010000000" =>   slv_integer <= 7;
			when "0100000000" =>   slv_integer <= 8;
			when "1000000000" =>   slv_integer <= 9;
			when others       =>   slv_integer <= 10;
         end case;
   end process select_integer; -- leds

end architecture a_convert_sw_to_integer;