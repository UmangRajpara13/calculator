library ieee;
use ieee.std_logic_1164.all;

entity e_7_seg is 
   port (   
				clk 								:in    std_logic;
				number    			   :in    integer := 0;
				sev_seg_out       :out   std_logic_vector(6 downto 0)
				);
end entity e_7_seg;

architecture a_7_seg of e_7_seg is

--- signal declarations ---
--- remeber 7-segs are low active ---

	signal slv_0      : std_logic_vector(6 downto 0) :="0000001";
	signal slv_1 		: std_logic_vector(6 downto 0) :="1001111";
	signal slv_2 		: std_logic_vector(6 downto 0) :="0010010";
	signal slv_3 		: std_logic_vector(6 downto 0) :="0000110";
	signal slv_4 		: std_logic_vector(6 downto 0) :="1001100";
	signal slv_5 		: std_logic_vector(6 downto 0) :="0100100";
	signal slv_6 		: std_logic_vector(6 downto 0) :="0100000";
	signal slv_7 		: std_logic_vector(6 downto 0) :="0001111";
	signal slv_8      : std_logic_vector(6 downto 0) :="0000000";
	signal slv_9 	   : std_logic_vector(6 downto 0) :="0000100";  
	signal slv_X 	   : std_logic_vector(6 downto 0) :="1111111";  
	
begin

--- assignments ---
      
   hex_assignment: process (clk,number)
   begin
      case number is
			when 0 => sev_seg_out <= slv_0;
			
			when 1 => sev_seg_out <= slv_1;
			
			when 2 => sev_seg_out <= slv_2;
			
			when 3 => sev_seg_out <= slv_3;
			
			when 4 => sev_seg_out <= slv_4;
			
			when 5 => sev_seg_out <= slv_5;
			
			when 6 => sev_seg_out <= slv_6;
			
			when 7 => sev_seg_out <= slv_7;
			
			when 8 => sev_seg_out <= slv_8;
			
			when 9 => sev_seg_out <= slv_9;
			
         when others => sev_seg_out <= slv_x;
      end case;
   end process hex_assignment;
  
end architecture a_7_seg;