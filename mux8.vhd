-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--mux8

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY mux8 IS 
GENERIC ( n : INTEGER := 16);
	Port (Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			Choice : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			Output: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0));
END mux8;

ARCHITECTURE LogicFunc OF mux8 IS
BEGIN
	WITH Choice SELECT
	Output <= Input0 WHEN "000",
				 Input1 WHEN "001",
				 Input2 WHEN "010",
				 Input3 WHEN "011",
				 Input4 WHEN "100",
				 Input5 WHEN "101",
				 Input6 WHEN "110",
				 Input7 WHEN "111",
				 "0000000000000000" WHEN OTHERS;
END LogicFunc;

