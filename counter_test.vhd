--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:53:37 04/19/2019
-- Design Name:   
-- Module Name:   /home/nelarus-notebook/Documents/SD/trab1/counter_test.vhd
-- Project Name:  trab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_4bit
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
 
ENTITY counter_test IS
END counter_test;
 
ARCHITECTURE behavior OF counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_4bit
    PORT(
         up_down : IN  std_logic;
         count : IN  std_logic;
         load : IN  std_logic;
         load_input : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         C : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal up_down : std_logic := '0';
   signal count : std_logic := '0';
   signal load : std_logic := '0';
   signal load_input : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal C : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_4bit PORT MAP (
          up_down => up_down,
          count => count,
          load => load,
          load_input => load_input,
          reset => reset,
          clk => clk,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	--button press
	button: process
	begin
		count <= '1';
		wait for 15 ns;
		count <= '0';
		wait for 15 ns;
	end process;

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 50 ns;
		
		reset <= '0';
		up_down <= '1';

      wait for clk_period*50;
		
		up_down <= '0';
		
		wait for clk_period*50;
		
		load <= '1';
		load_input <= "0011";
		
		wait for clk_period*25;

      -- insert stimulus here 

      wait;
   end process;

END;
