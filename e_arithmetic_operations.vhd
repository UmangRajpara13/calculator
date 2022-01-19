library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity e_arithmetic_operations is 
port
	(
	 CLK   : in std_logic;
	 slv_x :in integer;
	 slv_y :in integer;
	 slv_start_operation : in std_logic;
	 slv_push_btn:in std_logic_vector(3 downto 0);
	 slv_out_unsigned: out integer

	);
end entity e_arithmetic_operations;


architecture a_arithmetic_operations of e_arithmetic_operations is
	signal slv_out_temp: integer;
	signal slv_add_temp: integer;
	

begin

	calculations: process (CLK)
	
	begin 
	
			if (slv_start_operation = '1' ) then 
				case slv_push_btn  is
			
					when "0001" =>	slv_out_unsigned <= slv_x + slv_y;
												
					when "0010" =>	slv_out_unsigned <= slv_x - slv_y;
				
					when "0100" =>	slv_out_unsigned <= slv_x / slv_y;
			
					when "1000" =>	slv_out_unsigned <= slv_x * slv_y;
			
					when others =>	slv_out_unsigned <= 0;
				end case;
			end if;
	
	end process;
	
end architecture a_arithmetic_operations;




