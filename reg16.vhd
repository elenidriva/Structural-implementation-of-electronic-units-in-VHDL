-- Ονοματεπώνυμο: Ελένη Δρίβα
-- ΑΜ: 3140047

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
ENTITY NOT2 IS
	PORT( inp1: IN std_logic;
			out1: OUT std_logic);
END NOT2;
ARCHITECTURE LogicFunc of NOT2 IS
	BEGIN
		out1 <= NOT inp1;
	END LogicFunc;


LIBRARY ieee;
USE ieee.std_logic_1164.all;  
	
ENTITY myAND3 IS
	PORT( inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END myAND3;

ARCHITECTURE LogicFunc of myAND3 IS
	BEGIN
		out1 <= inp1 AND inp2 AND inp3;
END LogicFunc;


LIBRARY ieee;
USE ieee.std_logic_1164.all;  
	
ENTITY myAND2 IS
	PORT( inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END myAND2;

ARCHITECTURE LogicFunc of myAND2 IS
	BEGIN
		out1 <= inp1 AND inp2;
END LogicFunc;
	


LIBRARY ieee;
USE ieee.std_logic_1164.all;  
	
ENTITY myNAND2 IS
	PORT( inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END myNAND2;

ARCHITECTURE LogicFunc of myNAND2 IS
	BEGIN
		out1 <= NOT(inp1 AND inp2);
END LogicFunc;

	

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY reg IS
	PORT( Input, Clock, Enable: IN std_logic;
			Output: OUT std_logic);
END reg;

ARCHITECTURE LogicFuncStructural OF reg IS

COMPONENT myNAND2
	PORT (inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;	
COMPONENT myAND2
	PORT (inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;			

COMPONENT NOT2
	PORT (inp1: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;			

COMPONENT myAND3
	PORT (inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;	

SIGNAL P1, P2, P3, P4, five, six, afterClock, temp: std_logic;
BEGIN
	V0: myNAND2 port map (P1, P4, P3);
	V1: myNAND2 port map (afterClock, P3, P1);
	V2: myAND3 port map (afterClock, P1, P4, temp);
	V3: NOT2 port map(temp, P2);
	V4: myNAND2 port map (Input, P2, P4);
	V5: myNAND2 port map (P1, six, five);
	V6: myNAND2 port map (five, P2, six);
	V7: myAND2 port map (clock, Enable, afterClock);
	PROCESS
	BEGIN
	WAIT UNTIL Clock'EVENT AND Clock ='1';
	IF Enable = '1' THEN
		Output<= five;
	END IF;
	END PROCESS;
END LogicFuncStructural;




LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY reg16 IS
	PORT( Input: IN std_logic_vector (15 DOWNTO 0); 
	Clock, Enable: IN std_logic;
			Output: OUT std_logic_vector(15 DOWNTO 0));
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
