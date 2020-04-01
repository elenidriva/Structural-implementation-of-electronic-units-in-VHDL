-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
-- sign_extender
-- Apla vlepei to 1o bit kai to kanei extend apo 6 bit se 16
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
ENTITY sign_extender IS
GENERIC (
			n : INTEGER :=16;
			k : INTEGER :=6
		);
PORT ( immediate : IN STD_LOGIC_VECTOR (k-1 DOWNTO 0);
		extended: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
		);
END sign_extender;

ARCHITECTURE LogicFunc OF sign_extender IS
	BEGIN
	extended <= (n-1 DOWNTO k => immediate(k-1)) & (immediate);
END LogicFunc;