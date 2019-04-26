
-- VHDL Instantiation Created from source file button_singlepress.vhd -- 11:31:16 04/20/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT button_singlepress
	PORT(
		button : IN std_logic;
		clk : IN std_logic;          
		press : OUT std_logic
		);
	END COMPONENT;

	Inst_button_singlepress: button_singlepress PORT MAP(
		button => ,
		clk => ,
		press => 
	);


