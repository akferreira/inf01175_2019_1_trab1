----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:33 04/20/2019 
-- Design Name: 
-- Module Name:    nibble_7seg - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nibble_7seg is
    Port ( nibble : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  display_catode : out  STD_LOGIC_VECTOR (6 downto 0);
           display_anode : out  STD_LOGIC_VECTOR (6 downto 0));
end nibble_7seg;

architecture Behavioral of nibble_7seg is

signal seg7 : STD_LOGIC_VECTOR(6 downto 0);
signal reg_out : STD_LOGIC_VECTOR(6 downto 0);

constant ZERO_8bit : std_logic_vector(7 downto 0) := (others => '0');
constant UM_8bit : std_logic_vector(7 downto 0) := (others => '1');

begin

conversion: process(nibble)
begin
	case nibble is
		when x"0" =>
		seg7 <= "0000001";
		when x"1" =>
		seg7 <= "1001111";
		when x"2" =>
		seg7 <= "0010010";
		when x"3" =>
		seg7 <= "0000110";
		when x"4" =>
		seg7 <= "1001100";
		when x"5" =>
		seg7 <= "0100100";
		when x"6" =>
		seg7 <= "0100000";
		when x"7" =>
		seg7 <= "0001111";
		when x"8" =>
		seg7 <= "0000000";
		when x"9" =>
		seg7 <= "0000100";
		when x"A" =>
		seg7 <= "0001000";
		when x"B" =>
		seg7 <= "1100000";
		when x"C" =>
		seg7 <= "0110001";
		when x"D" =>
		seg7 <= "1000010";
		when x"E" =>
		seg7 <= "0110000";
		when others =>
		seg7 <= "0111000";
	end case;

end process;

nibble_reg : process(clk,reset)
begin
		if reset = '1' then
			reg_out <= (others => '0');
			
		elsif (clk'event and clk = '1') then
			reg_out <= seg7;
			
		else
			reg_out <= reg_out;
		end if;

end process;

display_anode <= reg_out;
display_catode <= not(reg_out);

end Behavioral;

