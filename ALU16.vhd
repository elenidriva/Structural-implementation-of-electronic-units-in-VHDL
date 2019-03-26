-- Ονοματεπώνυμο: Ελένη Δρίβα
-- ΑΜ: 3140047

-- 1-bit ALU
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY AND1 IS
	PORT( inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END AND1;

ARCHITECTURE LogicFunc of AND1 IS
	BEGIN
		out1 <= inp1 AND inp2;
END LogicFunc;

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY OR1 IS
	PORT( inp1, inp2: IN std_logic;
			out1: OUT std_logic);
END OR1;

ARCHITECTURE LogicFunc of OR1 IS
	BEGIN
		out1 <= inp1 OR inp2;
END LogicFunc;
	
	
LIBRARY ieee;
USE ieee.std_logic_1164.all; 	
	
ENTITY ORthree IS
	PORT( inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END ORthree;

ARCHITECTURE LogicFunc of ORthree IS
	BEGIN
		out1 <= inp1 OR inp2 OR inp3;
	END LogicFunc;


LIBRARY ieee;
USE ieee.std_logic_1164.all; 	

ENTITY NOT1 IS
	PORT( inp1: IN std_logic;
			out1: OUT std_logic);
END NOT1;
ARCHITECTURE LogicFunc of NOT1 IS
	BEGIN
		out1<= '1' WHEN inp1 ='0' ELSE
		'0';
	END LogicFunc;

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
	
ENTITY XOR3 IS
	PORT( inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END XOR3;

ARCHITECTURE LogicFunc of XOR3 IS
	BEGIN
		out1 <= inp1 XOR inp2 XOR inp3;
	END LogicFunc;
	
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY GEQ IS
	PORT( inp1: IN std_logic;
			out1: OUT std_logic);
END GEQ;

ARCHITECTURE LogicFunc of GEQ IS
	BEGIN
		out1 <= '0' WHEN inp1='0' ELSE 
		 '1';
	END LogicFunc;	
	
	
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE  ieee.std_logic_signed.all; 

ENTITY FullAdder IS
	PORT( inp1, inp2, cin: IN std_logic;
			sum, cout: OUT std_logic);
END FullAdder;
ARCHITECTURE log_structural of FullAdder IS

COMPONENT AND1
		PORT(inp1, inp2: IN std_logic;
				out1: OUT std_logic);
END COMPONENT;

COMPONENT ORthree
	PORT (inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;

COMPONENT XOR3
	PORT (inp1, inp2, inp3: IN std_logic;
			out1: OUT std_logic);
END COMPONENT;

SIGNAL s1, s2, s3: std_logic;
BEGIN
 V0: XOR3 port map( inp1, inp2, cin, sum);
 V1: AND1 port map (inp1, inp2, s1);
 V2: AND1 port map (inp1, cin, s2);
 V3: AND1 port map (inp2, cin, s3);
 V4: ORthree port map(s1, s2, s3, cout);
 END log_structural;

	
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
ENTITY mux IS
		PORT ( inp1, inp2, s: IN std_logic;
				out1: OUT std_logic);
END mux;

ARCHITECTURE LogicFunc OF mux IS
BEGIN	
		out1 <= (inp1 AND NOT s) OR (inp2 AND NOT s);
END LogicFunc;


LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY mux3 IS
		PORT ( inp1, inp2, inp3, s1, s2: IN std_logic;
				out1: OUT std_logic);
END mux3;

ARCHITECTURE LogicFunc OF mux3 IS
	component mux
		PORT ( inp1, inp2, s: IN std_logic;
				 out1: OUT std_logic);
				 end component;
SIGNAL f: std_logic;
	BEGIN
		G1: mux port map (inp1, inp2, s1, f);
		G2: mux port map (f, inp3, s2, out1);
	END LogicFunc;	
	
-- 16-bit alu made of 16 x 1-bit alus
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE  ieee.std_logic_signed.all; 

ENTITY alu IS
	PORT(inp1, inp2, inp1inv, inp2inv,cin, op1, op2: IN std_logic;
			operation: IN std_logic_vector(2 downto 0);
			out1, cout: OUT std_logic);
END alu;


ARCHITECTURE arch_alu OF alu IS

	COMPONENT FullAdder IS
		PORT( inp1, inp2, cin: IN std_logic;
				sum, cout: OUT std_logic);
	END COMPONENT;
		
	COMPONENT mux IS
		PORT( inp1, inp2, s: IN std_logic;
				out1: OUT std_logic);
	END COMPONENT;
		COMPONENT mux3 IS
		PORT ( inp1, inp2, inp3, s1, s2: IN std_logic;
				out1: OUT std_logic);
	END COMPONENT;

	
	SIGNAL f1, f2, f3, f4, f5 : std_logic;	
	BEGIN
		G0: mux port map (inp1, NOT inp1, inp1inv, f1);
		G1: mux port map (inp2, NOT inp2, inp2inv, f2);
		f3 <= f1 AND f2;
		f4 <= f1 OR f2;
		G2: FullAdder port map ( f1, f2, cin, f5, cout);
		G3: mux3 port map ( f3, f4, f5, op1, op2, out1);

END arch_alu;


LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_signed.all; 
USE ieee.numeric_std.all;

ENTITY ALU16 IS
    PORT (inp1 ,inp2 : IN STD_LOGIC_VECTOR(15 downto 0);
				cin: IN std_logic;
				cout: OUT std_logic;
          Operation : IN std_logic_vector(3 downto 0);
          Out1	: OUT STD_LOGIC_vector(15 downto 0)); 
END ALU16;

ARCHITECTURE arch_ALU16 OF ALU16 IS
  COMPONENT alu 
	PORT(inp1, inp2, cin, inp1inv, inp2inv,op1, op2: IN std_logic;
		  Out1, cout: OUT std_logic
	);
	END COMPONENT;
	SIGNAL couts, tempOut: std_logic_vector(15 DOWNTO 0);
	SIGNAL res: std_logic;
	
	constant ADD_Funct: std_logic_vector(3 DOWNTO 0):= "0000";
	constant SUB_Funct: std_logic_vector(3 DOWNTO 0):= "0001";
	constant AND_Funct: std_logic_vector(3 DOWNTO 0):= "0010";
	constant OR_Funct: std_logic_vector(3 DOWNTO 0):= "0011";
	constant GEQ_Funct: std_logic_vector(3 DOWNTO 0):= "0100";
	constant NOT_Funct: std_logic_vector(3 DOWNTO 0):= "0101";
	
BEGIN
		PROCESS(Operation) IS
		VARIABLE temp: std_logic_vector(15 DOWNTO 0);
		VARIABLE temp2: std_logic_vector(31 DOWNTO 0);
		VARIABLE temp3, temp4: std_logic;
		BEGIN	
			CASE Operation IS
				WHEN ADD_Funct =>
					temp:= inp1 + inp2;
				WHEN SUB_Funct =>
					temp:= inp1 - inp2;
				WHEN AND_Funct =>
					temp:= inp1 AND inp2;
				WHEN OR_Funct =>
					temp:= inp1 OR inp2;
				WHEN GEQ_Funct =>
					IF ( inp1(15) = '1') THEN
						temp:= ( 0 => '0', OTHERS => '0');
					ELSE
						temp:= ( 0 => '1', OTHERS => '0');
						END IF;
				WHEN NOT_Funct =>
					temp:= (OTHERS => '0');
					IF(inp1 = (15 DOWNTO 0 => '0')) THEN
					temp(0) := '1';
					END IF;
				WHEN OTHERS =>
					temp:= inp1 - inp2; -- Estw ta alla OpCodes ta kanw substract.
			END CASE;
			IF (temp4='0')THEN	
				cout <= temp3;
			ELSE
				cout<= res;
			END IF;
			Out1 <= temp;
		
		END PROCESS;

alu_1: alu port map (inp1(0), inp2(0), cin, Operation(3), Operation(2), Operation(0), Operation(1), tempOut(0), couts(0));
alu_2: alu port map (inp1(1), inp2(1), couts(0), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(1), couts(1));
alu_3: alu port map (inp1(2), inp2(2), couts(1), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(2), couts(2));
alu_4: alu port map (inp1(3), inp2(3), couts(2), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(3), couts(3));
alu_5: alu port map (inp1(4), inp2(4), couts(3), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(4), couts(4));
alu_6: alu port map (inp1(5), inp2(5), couts(4), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(5), couts(5));
alu_7: alu port map (inp1(6), inp2(6), couts(5), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(6), couts(6));
alu_8: alu port map (inp1(7), inp2(7), couts(6), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(7), couts(7));
alu_9: alu port map (inp1(8), inp2(8), couts(7), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(8), couts(8));
alu_10: alu port map (inp1(9), inp2(9), couts(8), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(9), couts(9));
alu_11: alu port map (inp1(10), inp2(10), couts(9), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(10), couts(10));
alu_12: alu port map (inp1(11), inp2(11), couts(10), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(11), couts(11));
alu_13: alu port map (inp1(12), inp2(12), couts(11), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(12), couts(12));
alu_14: alu port map (inp1(13), inp2(13), couts(12), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(13), couts(13));
alu_15: alu port map (inp1(14), inp2(14), couts(13), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(14), couts(14));
alu_16: alu port map (inp1(15), inp2(15), couts(14), Operation(3), Operation(2), Operation(0), Operation(1), tempOut(15), res);

END arch_ALU16;	