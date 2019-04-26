--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:53:14 04/21/2019
-- Design Name:   
-- Module Name:   /home/nelarus-notebook/Documents/SD/trab1/nibble_tb.vhd
-- Project Name:  trab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nibble_7seg
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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY nibble_tb IS
END nibble_tb;
 
ARCHITECTURE behavior OF nibble_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nibble_7seg
    PORT(
         nibble : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         display_catode : OUT  std_logic_vector(6 downto 0);
         display_anode : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nibble : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal display_catode : std_logic_vector(6 downto 0);
   signal display_anode : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nibble_7seg PORT MAP (
          nibble => nibble,
          clk => clk,
          reset => reset,
          display_catode => display_catode,
          display_anode => display_anode
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	increment: process
	begin
		nibble <= std_logic_vector(unsigned(nibble)+1);
		wait for clk_period*3;
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
