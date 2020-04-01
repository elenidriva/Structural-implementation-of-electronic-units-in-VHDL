-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--pseudo-reg

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY reg0 IS 
GENERIC ( n : INTEGER := 16);
	Port (Input: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			Clock, Enable : IN STD_LOGIC;
			Output: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0));
END reg0;

ARCHITECTURE Behaviour OF reg0 IS
BEGIN
	Output <= (OTHERS => '0');
END Behaviour;	

