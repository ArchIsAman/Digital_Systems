library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end; 
architecture Behave of TestBench is 

component led is
port( on_switch,reset,clock: in std_logic;
outp: out std_logic_vector(7 downto 0));
end component led;

signal inclock_test,reset_test:std_logic :='1' ;
signal onswitch_test:std_logic :='0'; 
signal outclock_test:std_logic_vector(7 downto 0);

begin 
inclock_test <= not inclock_test after 10 ns;
reset_test <= '1','0' after 700 ns;
--onswitch_test <= not onswitch_test after 1000000000 ns;
onswitch_test <= '1';

dut_instance:led port map (onswitch_test,reset_test,inclock_test,outclock_test);

end Behave;