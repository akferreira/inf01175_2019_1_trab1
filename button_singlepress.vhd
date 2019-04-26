----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:46 04/20/2019 
-- Design Name: 
-- Module Name:    button_singlepress - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity button_singlepress is
    Port ( button : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           press : out  STD_LOGIC);
end button_singlepress;

architecture Behavioral of button_singlepress is

signal ff1,ff2 : STD_LOGIC;

begin

pulse_gen: process(clk, button)
begin
  if button = '0' then
       ff1 <= '0';
		 ff2 <= '0';
  elsif rising_edge(clk) then 
       ff1 <= button;
		 ff2 <= ff1;
  else
       ff1 <= ff1;
		 ff2 <= ff2;
  end if;
end process;

press <= ff1 and (not ff2);


end Behavioral;

