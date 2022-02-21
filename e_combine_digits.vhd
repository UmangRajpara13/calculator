library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity e_combine_digits is 
port
	(	
	 slv_x :in integer;
	 slv_y :in integer;
	 	 
	 slv_out_unsigned: out integer
	);
end entity e_combine_digits;


architecture a_combine_int of e_combine_digits is

	signal slv_temp: integer;
	signal slv_add_temp: integer;

begin
	
	slv_temp <= slv_x *  10;  
	slv_out_unsigned <=	slv_temp + slv_y;

end architecture a_combine_int;




