-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--reg

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY reg IS
Port (Input, Clock, Enable : IN STD_LOGIC;
		Output: OUT STD_LOGIC);
END reg;

ARCHITECTURE LogicFunc OF reg IS
SIGNAL s1, s2, s3, s4, five, six, afterClock : STD_LOGIC;
BEGIN
		s3 <= s1 NAND s4;
		s1 <= afterClock NAND s3;
		s2 <= NOT(afterClock AND s1 AND s4);
		s4 <= Input NAND s2;
		five <= six NAND s1;
		six <= s2 NAND five;
		afterClock <= Clock AND Enable;
		
	PROCESS
	BEGIN
	WAIT UNTIL Clock'EVENT AND Clock ='1';
	IF Enable = '1' THEN
		Output<= five;
	END IF;
	END PROCESS;

END LogicFunc;

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
ENTITY reg16 IS
GENERIC (
			n : INTEGER :=16	
		);
PORT ( Input : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		 Enable, CLock : IN STD_LOGIC;
		Output: OUT STD_LOGIC_VECTOR ( n-1 DOWNTO 0)
		);
END reg16;

ARCHITECTURE LogicFunc OF reg16 IS
COMPONENT reg IS
	PORT(Input, Clock, Enable: IN std_logic;
			Output: OUT std_logic);
END COMPONENT;
BEGIN
	G0: reg port map(Input(0), Clock, Enable, Output(0));
	G1: reg port map(Input(1), Clock, Enable, Output(1));
	G2: reg port map(Input(2), Clock, Enable, Output(2));
	G3: reg port map(Input(3), Clock, Enable, Output(3));
	G4: reg port map(Input(4), Clock, Enable, Output(4));
	G5: reg port map(Input(5), Clock, Enable, Output(5));
	G6: reg port map(Input(6), Clock, Enable, Output(6));
	G7: reg port map(Input(7), Clock, Enable, Output(7));
	G8: reg port map(Input(8), Clock, Enable, Output(8));
	G9: reg port map(Input(9), Clock, Enable, Output(9));
	G10: reg port map(Input(10), Clock, Enable, Output(10));
	G11: reg port map(Input(11), Clock, Enable, Output(11));
	G12: reg port map(Input(12), Clock, Enable, Output(12));
	G13: reg port map(Input(13), Clock, Enable, Output(13));
	G14: reg port map(Input(14), Clock, Enable, Output(14));
	G15: reg port map(Input(15), Clock, Enable, Output(15));
END LogicFunc;		

	
	