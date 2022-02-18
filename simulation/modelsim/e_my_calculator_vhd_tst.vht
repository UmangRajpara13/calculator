-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "07/30/2021 15:14:23"
                                                            
-- Vhdl Test Bench template for design  :  e_my_calculator
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY e_my_calculator_vhd_tst IS
END e_my_calculator_vhd_tst;
ARCHITECTURE e_my_calculator_arch OF e_my_calculator_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC := '0';
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL slv_out_unsigned : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0) := "0000000000";
COMPONENT e_my_calculator
	PORT (
	clk : IN STD_LOGIC;
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	slv_out_unsigned : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	HEX0 :out std_logic_vector(6 downto 0);	 
	 HEX1 :out std_logic_vector(6 downto 0);	 
	 HEX2 :out std_logic_vector(6 downto 0);	 
	 HEX3 :out std_logic_vector(6 downto 0);
	 HEX4 :out std_logic_vector(6 downto 0);
	 HEX5 :out std_logic_vector(6 downto 0);
	 HEX6 :out std_logic_vector(6 downto 0)
	 
	 
	
	);
END COMPONENT;
BEGIN
   CLK <= not CLK after 30ns;
	i1 : e_my_calculator
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	KEY => KEY,
	LEDR => LEDR,
	slv_out_unsigned => slv_out_unsigned,
	SW => SW
	);


always: process
		-- procedure declarations here

	procedure P_sync_app(constant c_loop: integer) is
	variable v_count: integer := 0;
	begin
		loop_cnt: while v_count <= c_loop loop
			wait until rising_edge(CLK);
				v_count := v_count + 1;
		end loop loop_cnt;
	end procedure P_sync_app;                                       
	
	
	procedure test is
	
		begin
		wait for 50ns;
		SW (0) <= '1';
		
		wait for 50ns;
	 	SW (0) <= '0';
	
		wait for 100ns;
		SW (1) <= '1';
		
		wait for 50ns;
		SW (1) <= '0';
		wait for 100ns;
		
		SW (2) <= '1';
		
		wait for 50ns;
		SW (2) <= '0';
		wait for 100ns;
		
		SW (1) <= '1';
		
		wait for 50ns;
		SW (1) <= '0';
		wait for 100ns;
		
		SW (0) <= '1';
		
		wait for 50ns;
		SW (0) <= '0';
		
		Key <= "1000";
		wait for 150ns;
		
		Key <= "0010";
		wait for 150ns;
		
		Key <= "0100";
		wait for 150ns;
		
		Key <= "0001";
		wait for 150ns;
		
		end procedure test;
	
	begin
	P_sync_app(5);
	test;
end process always;                 
END e_my_calculator_arch;
