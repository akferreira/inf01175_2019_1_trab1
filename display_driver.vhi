
-- VHDL Instantiation Created from source file display_driver.vhd -- 09:26:00 04/23/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT display_driver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		digit0 : IN std_logic_vector(6 downto 0);
		digit1 : IN std_logic_vector(6 downto 0);          
		display_sel : OUT std_logic_vector(3 downto 0);
		display_seg : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	Inst_display_driver: display_driver PORT MAP(
		clk => ,
		reset => ,
		digit0 => ,
		digit1 => ,
		display_sel => ,
		display_seg => 
	);


