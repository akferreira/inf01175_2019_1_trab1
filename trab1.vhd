----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:59 04/20/2019 
-- Design Name: 
-- Module Name:    trab1 - Behavioral 
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

entity trab1 is
    Port ( clk : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : in  STD_LOGIC;
			  sel : in STD_LOGIC;
           load : in  STD_LOGIC;
		     decimal_point: out std_logic;
           load_input : in  STD_LOGIC_VECTOR (3 downto 0);
			  display_pins: out STD_LOGIC_VECTOR(6 DOWNTO 0);
			  display_sel_pins: out STD_LOGIC_VECTOR(3 DOWNTO 0);
			  value : out STD_LOGIC_VECTOR (3 downto 0));
end trab1;

architecture Behavioral of trab1 is

COMPONENT button_singlepress
	PORT(
		button : IN std_logic;
		clk : IN std_logic;          
		press : OUT std_logic
		);
END COMPONENT;

COMPONENT counter_4bit
	PORT(
		up_down : IN std_logic;
		count_enable : IN std_logic;
		load : IN std_logic;
		load_input : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		C : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT adder
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

COMPONENT subtract
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

COMPONENT nibble_7seg
	PORT(
		nibble : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		display_catode : OUT std_logic_vector(6 downto 0);
		display_anode : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
COMPONENT display_driver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		digit0 : IN std_logic_vector(6 downto 0);
		digit1 : IN std_logic_vector(6 downto 0);   
		digit2 : IN std_logic_vector(6 downto 0);
		digit3 : IN std_logic_vector(6 downto 0); 		
		display_sel : OUT std_logic_vector(3 downto 0);
		display_seg : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

--debug variables
signal result : std_logic_vector(3 downto 0);

signal ireset : STD_LOGIC;
signal icount : STD_lOGIC;
signal iload : STD_lOGIC;
signal sum_8bit : STD_LOGIC_VECTOR(7 DOWNTO 0); --armazena resultado da soma
signal sub_8bit : STD_LOGIC_VECTOR(7 DOWNTO 0); -- resultado da subtracao

constant SEL_SUM : STD_LOGIC := '0';
constant ZERO_8bit : std_logic_vector(7 downto 0) := (others => '0'); 
--vetor de 8bits zerado para concatenar com vetores mais curtos, pondo
--os bits mais signifativos em 0 ex 11010 -> 00011010

--entradas do somador e do subtrator
signal e0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal e1 : STD_LOGIC_VECTOR(7 DOWNTO 0);

--variaveis mux
signal mux_out: STD_LOGIC_VECTOR(7 DOWNTO 0);

--reg mux
signal reg_mux_out : STD_LOGIC_VECTOR(7 DOWNTO 0) := ZERO_8bit;

--display segments
signal digit1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
signal digit0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
signal digit2: STD_LOGIC_VECTOR(6 DOWNTO 0);
signal digit3: STD_LOGIC_VECTOR(6 DOWNTO 0);



begin

reset_bt : button_singlepress 
PORT MAP(button => reset, clk => clk, press => ireset);

Inst_button_singlepress: button_singlepress 
PORT MAP(button => count,clk => clk,press => icount);

load_singlepress : button_singlepress 
PORT MAP(button => load,clk => clk,press => iload);
	
Inst_counter_4bit: counter_4bit 
PORT MAP(up_down => up_down,count_enable => icount,load => iload,
load_input => load_input,reset => ireset,clk => clk,C => result);
	
e0 <= (ZERO_8bit(7 downto 4) & result);
e1 <= (ZERO_8bit(7 downto 4) & "0011");

trab_adder : adder
PORT MAP (a => e0,b => e1,clk => clk,ce => '1',s => sum_8bit);
  
trab_sub : subtract 
PORT MAP (a => e0,b => e1,clk => clk,ce => '1',s => sub_8bit);


nibble2: nibble_7seg 
PORT MAP(nibble => reg_mux_out(7 downto 4),clk => clk,reset => ireset,display_anode => digit2);
	
nibble3: nibble_7seg 
PORT MAP(nibble => reg_mux_out(3 downto 0),clk => clk,reset => ireset,display_anode => digit3);

nibble1: nibble_7seg 
PORT MAP(nibble => ZERO_8bit(7 downto 4),clk => clk,reset => ireset,display_anode => digit1);
	
nibble0: nibble_7seg 
PORT MAP(nibble => ZERO_8bit(3 downto 0),clk => clk,reset => ireset,display_anode => digit0);

Inst_display_driver: display_driver 
PORT MAP(clk => clk,reset => ireset,digit0 => digit0,digit1 => digit1,digit2 => digit2,digit3 => digit3,display_sel => display_sel_pins,display_seg => display_pins);

decimal_point <= '1';
--debugging, output somente para visualizar no simulador
value <= result;

mux_16_8_out: process(clk,sel)
begin
	if sel = SEL_SUM then
		mux_out <= sum_8bit;
	else
		mux_out <= sub_8bit;
	end if;
end process;

mux_reg:process(clk)
begin
	if(clk'event and clk = '1') then
		reg_mux_out <= mux_out;
	end if;
end process;



end Behavioral;

