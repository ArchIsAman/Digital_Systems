library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity FULL_SUBTRACTOR is
	port (P,Q,R: in std_logic; BORROW, DIFFERENCE: out std_logic);
	--P -  Q is difference
	-- R is borrowed
end entity FULL_SUBTRACTOR;

architecture Structure of FULL_SUBTRACTOR is
	signal  P_BAR_Q,P_Q_BAR, P_NOR_Q, NOT_P_XOR_Q, P_XOR_Q, NOT_BORROW, O_EIGHT, O_NINE, O_TEN, NOT_DIFFERENCE   : std_logic;
	-- BORROW == P_BAR_Q
begin
	NOR1: NOR_2 port map (A => P, B => Q, Y=> P_NOR_Q);
	
	--NOR2: NOR_2 port map (A => P, B => P_NOR_Q, Y=> BORROW);
	
	NOR2: NOR_2 port map (A => P, B => P_NOR_Q, Y=> P_BAR_Q);
	
	NOR3: NOR_2 port map (A => P_NOR_Q, B => Q, Y=> P_Q_BAR);
	
	NOR4: NOR_2 port map (A => P_BAR_Q, B => P_Q_BAR, Y=> NOT_P_XOR_Q);
	
	NOR5: NOR_2 port map (A => NOT_P_XOR_Q, B => NOT_P_XOR_Q, Y=> P_XOR_Q);
	
	
	
	NOR8: NOR_2 port map (A => R, B => P_XOR_Q, Y=> O_EIGHT);
	
	NOR9: NOR_2 port map (A => O_EIGHT, B => P_XOR_Q, Y=> O_NINE);
	
	NOR6: NOR_2 port map (A => O_NINE, B => P_BAR_Q, Y=> NOT_BORROW);
	
	NOR7: NOR_2 port map (A => NOT_BORROW, B => NOT_BORROW, Y=> BORROW);
	
	NOR10: NOR_2 port map (A => R, B => O_EIGHT, Y=> O_TEN);
	
	NOR11: NOR_2 port map (A => O_NINE, B => O_TEN, Y=> NOT_DIFFERENCE);
	
	NOR12: NOR_2 port map (A => NOT_DIFFERENCE, B => NOT_DIFFERENCE, Y=> DIFFERENCE);
	
	
	end architecture;