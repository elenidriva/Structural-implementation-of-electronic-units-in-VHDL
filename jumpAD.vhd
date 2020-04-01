-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
--jumpAD

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;

ENTITY jumpAD IS
GENERIC (
			n : INTEGER :=16;
			k : INTEGER :=12
		);
PORT ( jumpADR : IN STD_LOGIC_VECTOR (k-1 DOWNTO 0);
		 instrP2AD : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		EjumpAD: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
		);
END jumpAD;
ARCHITECTURE LogicFunc OF jumpAD IS
	SIGNAL extended, multed: std_logic_vector (n-1 downto 0);
	begin 
	extended <= (n-1 DOWNTO k => jumpADR(k-1)) & (jumpADR);
process (instrP2AD)
	begin		
		multed <= extended(n-2 downto 0) & '0';
		EjumpAD <= std_LOGIC_VECTOR( unsigned (multed) + unsigned (instrP2AD));
end process;
END LogicFunc;