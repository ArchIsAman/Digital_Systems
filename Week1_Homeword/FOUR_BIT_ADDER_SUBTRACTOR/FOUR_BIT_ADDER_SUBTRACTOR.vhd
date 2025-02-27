library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;
use work.FULL_ADDER.all;

entity FOUR_BIT_ADDER_SUBTRACTOR is
	port (A0,A1, A2, A3, B0, B1, B2, B3, M: in std_logic; S0, S1, S2, S3, Cout : out std_logic);
end entity FOUR_BIT_ADDER_SUBTRACTOR;

architecture Structure of FOUR_BIT_ADDER_SUBTRACTOR is
	signal T1, T2, T3, T0, C0, C1, C2	 : std_logic;
begin
	XOR0: XOR_2 port map (A => M, B => B0, Y=> T0);
	
	XOR1: XOR_2 port map (A => M, B => B1, Y=> T1);

	XOR2: XOR_2 port map (A => M, B => B2, Y=> T2);

	XOR3: XOR_2 port map (A => M, B => B3, Y=> T3);
	
	FULLADDER0: FULLADDER port map (A => A0, B => T0, Cin=> M,S => S0, Cout=> C0);
	
	FULLADDER1: FULLADDER port map (A => A1, B => T1, Cin=> C0,S => S1, Cout=> C1);

	FULLADDER2: FULLADDER port map (A => A2, B => T2, Cin=> C1,S => S2, Cout=> C2);
	
	FULLADDER3: FULLADDER port map (A => A3, B => T3, Cin=> C2,S => S3, Cout=> Cout);
	
	--ConstOut <= "11111";
	
	
end architecture;