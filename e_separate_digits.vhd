library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity e_get_digit_from_int is 
   port (
				clk			 :in    std_logic;
				input_number :in    integer ;
				digit1       :out   integer;
				digit2       :out   integer;
				digit3       :out   integer
				
		);
end entity e_get_digit_from_int;

architecture a_get_digit_from_int of e_get_digit_from_int is

---- Declaration Part -----------------------------------------------

-- Signal Declarations

	signal slv_digit_1,slv_digit_2,slv_digit_3,slv_digit_4 : integer := 0 ;
	signal temp_input_number :integer;
--
begin

	converter: process(clk,input_number)
	begin
		temp_input_number <= input_number;
	
	
	
		digit3 <= slv_digit_1 mod 10;
		slv_digit_2 <= temp_input_number / 100;
	
		digit2 <= slv_digit_2 mod 10;
		slv_digit_3<= temp_input_number / 1000;
	
		digit1 <= slv_digit_3 mod 10;
	end process;
	
---- Assignment Part ------------------------------------------------

-- Concurrent Assignments:

end architecture a_get_digit_from_int ;