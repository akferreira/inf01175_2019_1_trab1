----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:56 04/20/2019 
-- Design Name: 
-- Module Name:    display_driver - Behavioral 
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
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_driver is
    Port ( clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           digit0 : in  STD_LOGIC_VECTOR (6 downto 0);
           digit1 : in  STD_LOGIC_VECTOR (6 downto 0);
			  digit2 : in  STD_LOGIC_VECTOR (6 downto 0);
			  digit3 : in  STD_LOGIC_VECTOR (6 downto 0);
			  display_sel : out STD_LOGIC_VECTOR(3 downto 0);
           display_seg : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver;

architecture Behavioral of display_driver is

type T_STATE is (S0, S1,S2,S3);
signal estado, prox_estado : T_STATE; 
signal count_enable : STD_LOGIC;
signal count_end : STD_LOGIC;
signal count: std_logic_vector(32 downto 0);

constant display0 : STD_LOGIC_VECTOR(3 downto 0) := "1110";
constant display1 : STD_LOGIC_VECTOR(3 downto 0) := "1101";
constant display2 : STD_LOGIC_VECTOR(3 downto 0) := "1011";
constant display3 : STD_LOGIC_VECTOR(3 downto 0) := "0111";

begin

next_state: process(count_end,estado)
begin

CASE estado is
when s0 => if count_end = '0' then prox_estado <= s0;
			  else prox_estado <= s1;end if;
			  
			  
when s1 => if count_end = '0' then prox_estado <= s1;
			  else prox_estado <= s2;end if;
			  
when s2 => if count_end = '0' then prox_estado <= s2;
			  else prox_estado <= s3;end if;
			  
when s3 => if count_end = '0' then prox_estado <= s3;
			  else prox_estado <= s0;end if;

END CASE;
end process;

--counting process
process (clk)
begin
	if reset = '1' then count <= (others => '0');
	
	elsif (clk'event and clk ='1') then
				if count_end = '1' then
					count <= (others => '0');
					count_end <= '0';
				else
					count <= std_logic_vector(unsigned(count)+1);
					count_end <= count(15);
				end if;
	end if;
	
end process;

--REG STATE
reg_state: process(clk)
begin

	if (clk'event and clk ='1')then
		estado <= prox_estado;
		
	end if;
end process;

--OUTPUT
process(estado)
begin
if estado = s0 then 
	display_sel <= display0;
	display_seg <= digit0;

elsif estado = s1 then
	display_sel <= display1;
	display_seg <= digit1;
	
elsif estado = s2 then
	display_sel <= display2;
	display_seg <= digit2;
	
elsif estado = s3 then 
	display_sel <= display3;
	display_seg <= digit3;

end if;
end process;

end Behavioral;

