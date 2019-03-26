-- Ονοματεπώνυμο: Ελένη Δρίβα
-- ΑΜ: 3140047

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY questionC IS
	PORT(Clock, Enable: IN std_logic;
			inp1, inp2: IN std_logic_vector(15 downto 0);
			Operation: IN std_logic_vector(3 downto 0);
			ALUout, F1, F2, Output: OUT std_logic_vector(15 downto 0));
END questionC;


ARCHITECTURE arch_C OF questionC IS

	COMPONENT ALU16 IS
    PORT (inp1 ,inp2 : IN STD_LOGIC_VECTOR(15 downto 0);

          Operation : IN std_logic_vector(3 downto 0);
          Out1	: OUT STD_LOGIC_vector(15 downto 0)); 
	END COMPONENT;
	
	
	COMPONENT reg16 IS
		PORT( Input: IN std_logic_vector (15 DOWNTO 0); 
				Clock, Enable: IN std_logic;
				Output: OUT std_logic_vector(15 DOWNTO 0));
	END COMPONENT;
	
SIGNAL 
	s1, s2, salu, s3: std_LOGIC_vector (15 downto 0);
	BEGIN
		FF1: reg16 port map(inp1, Clock, Enable, s1);
		FF2: reg16 port map(inp2, Clock, Enable, s2);
		F1 <= s1;
		F2 <= s2;
		alu_1: ALU16 port map(s1, s2, Operation, salu);
		ALUout <= salu;
		FF3: reg16 port map(salu, Clock, Enable, s3);
		Output <= s3;

END arch_C;

-- Αυτό που παρατηρώ είναι ότι (πέρα από ότι μεσολαβεί μικρή καθυστέρηση) το output αλλάζει  όταν το 
-- Enable = 1 και το Clock πηγαίνει προς το 1(rising edge). Σε πολλά διαστηματα  οι τιμές που μεταφέρονται
-- στο ALU (έξοδος από τα 2 πρώτα flip-flops) είναι ίδιες και πάνω σε αυτές γίνονται πολλά operations.
-- Και οι F1 - F2 αλλάζουν με Enable = 1 και rising_edge  του Clock