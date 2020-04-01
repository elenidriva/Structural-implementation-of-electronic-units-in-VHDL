-- Ον/νυμο: Δρίβα Ελένη 
-- ΑΜ :3140047
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 


ENTITY AluControl IS
    PORT (opCode : IN STD_LOGIC_VECTOR(3 downto 0);
				func: IN STD_LOGIC_VECTOR(2 downto 0);
          output	: OUT STD_LOGIC_vector(3 downto 0)); 
END AluControl;

ARCHITECTURE behavioral of AluControl IS

	BEGIN
		PROCESS (opCode, func) 
			BEGIN
			IF (opCode = "0000") THEN -- Load/Store Functions
				output <= "0010";			-- Set to add to calculate the address
			ELSIF (opCode = "0001") THEN -- Branch on Equal
				output <= "0110";			-- Set to Substract
			ELSE  -- R-Type
				output(3) <= '0';
				output(2 downto 0) <= func(2 downto 0);
			END IF;
			
		END PROCESS;


END behavioral;

