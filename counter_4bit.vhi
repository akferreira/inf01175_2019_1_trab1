
-- VHDL Instantiation Created from source file counter_4bit.vhd -- 11:32:20 04/20/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_counter_4bit: counter_4bit PORT MAP(
		up_down => ,
		count_enable => ,
		load => ,
		load_input => ,
		reset => ,
		clk => ,
		C => 
	);


