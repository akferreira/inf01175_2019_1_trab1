
-- VHDL Instantiation Created from source file nibble_7seg.vhd -- 09:16:15 04/23/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT nibble_7seg
	PORT(
		nibble : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		display_catode : OUT std_logic_vector(6 downto 0);
		display_anode : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	Inst_nibble_7seg: nibble_7seg PORT MAP(
		nibble => ,
		clk => ,
		reset => ,
		display_catode => ,
		display_anode => 
	);


