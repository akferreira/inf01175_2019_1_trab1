--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:09:59 04/20/2019
-- Design Name:   
-- Module Name:   /home/nelarus-notebook/Documents/SD/trab1/button_tb.vhd
-- Project Name:  trab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: button_singlepress
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY button_tb IS
END button_tb;
 
ARCHITECTURE behavior OF button_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT button_singlepress
    PORT(
         button : IN  std_logic;
         clk : IN  std_logic;
         press : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal button : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal press : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: button_singlepress PORT MAP (
          button => button,
          clk => clk,
          press => press
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	--button
	button_press: process
	begin
		button <= '1';
		wait for 80 ns;
		button <= '0';
		wait for 80 ns;
	end process;
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
