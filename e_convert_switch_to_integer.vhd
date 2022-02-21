library ieee;
use ieee.std_logic_1164.all;


entity e_convert_switch_to_integer is 
   port (  switch_input   : in std_logic_vector(9 downto 0);
           out_integer    : out integer
				);
end entity e_convert_switch_to_integer ;

architecture a_convert_switch_to_integer of e_convert_switch_to_integer is
	
begin

--- assignments ---
	
   integer_from_switch: process (switch_input) 
   begin
      case switch_input IS
			when "0000000001" =>   out_integer <= 0;
         when "0000000010" =>   out_integer <= 1;
         when "0000000100" =>   out_integer <= 2;
         when "0000001000" =>   out_integer <= 3;
         when "0000010000" =>   out_integer <= 4;
         when "0000100000" =>   out_integer <= 5;
			when "0001000000" =>   out_integer <= 6;
			when "0010000000" =>   out_integer <= 7;
			when "0100000000" =>   out_integer <= 8;
			when "1000000000" =>   out_integer <= 9;
			when others       =>   out_integer <= 10;
         end case;
   end process integer_from_switch; 

end architecture a_convert_switch_to_integer;