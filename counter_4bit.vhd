----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:55 04/19/2019 
-- Design Name: 
-- Module Name:    counter_4bit - Behavioral 
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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4bit is
    Port ( up_down : in  STD_LOGIC;
           count_enable : in  STD_LOGIC;
           load : in  STD_LOGIC;
           load_input : in  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is


signal count_value : STD_LOGIC_VECTOR (3 downto 0);

constant UP : STD_LOGIC := '1';
constant DOWN : STD_LOGIC := not UP;
begin


--counting process
process (clk,reset)
begin
	if reset = '1' then count_value <= (others => '0');
	
	elsif (clk'event and clk ='1') then
		if load = '1' then
			count_value <= load_input;
		
		elsif count_enable = '1' then
			if up_down = UP then
				count_value <= std_logic_vector(unsigned(count_value)+1);
				
			else
				count_value <= std_logic_vector(unsigned(count_value)-1);
			end if;
	
		else
			count_value <= count_value;
		
		end if;
	end if;
	
end process;

C <= count_value;

end Behavioral;

