-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--regFile

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY regFile IS
GENERIC (
				n : integer :=16;
				k : integer :=3;
				regNum : integer :=8
			);
Port ( Clock : IN STD_LOGIC;
		 Write1: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		 Write1AD, Read1AD, Read2AD : IN STD_LOGIC_VECTOR (k-1 DOWNTO 0);
		 Read1, Read2 : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		 OUTall: OUT STD_LOGIC_VECTOR(n*regNum-1 DOWNTO 0)
		);
END regFile;

ARCHITECTURE LogicFunc OF regFile IS

COMPONENT reg0 IS
	PORT(Input : IN std_logic_vector (n-1 downto 0);
		  Enable, Clock : IN std_logic;
		  Output: out std_logic_vector (n-1 downto 0));
END COMPONENT;

COMPONENT reg16 IS
	PORT(Input : IN std_logic_vector (n-1 downto 0);
		  Enable, Clock : IN std_logic;
		  Output: out std_logic_vector (n-1 downto 0));
END COMPONENT;

COMPONENT dec3to8 IS
	PORT(Input : IN std_logic_vector (k-1 downto 0);

		  Output: out std_logic_vector (regNum-1 downto 0));
END COMPONENT;

COMPONENT mux8 IS
	PORT(Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7 : IN std_logic_vector (n-1 downto 0);
		  Choice : IN std_logic_vector (k-1 downto 0);
		  Output: out std_logic_vector (n-1 downto 0));
END COMPONENT;

SIGNAL enableSigs: std_logic_vector (regNum-1 DOWNTO 0);
SIGNAL re0, re1, re2, re3, re4, re5, re6, re7: std_logic_vector (n-1 downto 0);

BEGIN



	G0: dec3to8 port map (Write1AD, enableSigs);
	G1: reg0 port map ( Write1, enableSigs(0), Clock, re0);
	G2: reg16 port map (Write1, enableSigs(1), Clock, re1);
	G3: reg16 port map (Write1, enableSigs(2), Clock, re2);
	G4: reg16 port map (Write1, enableSigs(3), Clock, re3);
	G5: reg16 port map (Write1, enableSigs(4), Clock, re4);
	G6: reg16 port map (Write1, enableSigs(5), Clock, re5);
	G7: reg16 port map (Write1, enableSigs(6), Clock, re6);
	G8: reg16 port map (Write1, enableSigs(7), Clock, re7);
	
	G9: mux8 port map (re0, re1, re2, re3, re4, re5, re6, re7, Read1AD, Read1);
	G10: mux8 port map (re0, re1, re2, re3, re4, re5, re6, re7, Read2AD, Read2);
	
	
	
	OUTall <= re7 & re6 & re5 &re4 & re3 & re2 & re1 & re0;

END LogicFunc;
