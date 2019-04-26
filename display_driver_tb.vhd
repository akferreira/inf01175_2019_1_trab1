--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:40:16 04/21/2019
-- Design Name:   
-- Module Name:   /home/nelarus-notebook/Documents/SD/trab1/display_driver_tb.vhd
-- Project Name:  trab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: display_driver
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
 
ENTITY display_driver_tb IS
END display_driver_tb;
 
ARCHITECTURE behavior OF display_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display_driver
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         digit0 : IN  std_logic_vector(6 downto 0);
         digit1 : IN  std_logic_vector(6 downto 0);
         display_sel : OUT  std_logic_vector(3 downto 0);
         display_seg : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal digit0 : std_logic_vector(6 downto 0) := (others => '0');
   signal digit1 : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal display_sel : std_logic_vector(3 downto 0);
   signal display_seg : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_driver PORT MAP (
          clk => clk,
          reset => reset,
          digit0 => digit0,
          digit1 => digit1,
          display_sel => display_sel,
          display_seg => display_seg
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
		digit0 <= "0001111";
		digit1 <= "1110000";
		

      wait for clk_period*100;
		
		digit0 <= "0011110";
		digit1 <= "1110001";

      -- insert stimulus here 

      wait;
   end process;

END;
