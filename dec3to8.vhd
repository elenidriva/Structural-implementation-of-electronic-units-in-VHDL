-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--dec3to8


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY dec3to8 IS 
GENERIC ( n : INTEGER := 16);
	Port (Input: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			Output: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END dec3to8;

ARCHITECTURE LogicFunc OF dec3to8 IS
BEGIN
	WITH Input SELECT
	Output <= "00000001" WHEN "000",
				 "00000010" WHEN "001",
				 "00000100" WHEN "010",
				 "00001000" WHEN "011",
				 "00010000" WHEN "100",
				 "00100000" WHEN "101",
				 "01000000" WHEN "110",
				 "10000000" WHEN "111",
				 "00000000" WHEN OTHERS;
END LogicFunc;