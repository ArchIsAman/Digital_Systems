library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity runFSM is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic);
end runFSM;


architecture bhv of runFSM is
	---------------Define state type here-----------------------------
	type state is (rst,s1,s2); -- Fill other states here
	---------------Define signals of state type-----------------------
	signal y_present,y_next: state := rst;
	signal output_buffer : STD_LOGIC;

	begin
	clock_proc:process(clock,reset)

	begin

		if(clock='1' and clock' event) then
			if(reset='1') then
				y_present <= rst;
				
			else
				y_present <= y_next;
				
			end if;
		end if;
	end process;

	state_transition_proc:process(inp,y_present)
	begin
		case y_present is
			when rst=>
				if (unsigned(inp)=18) then --s has been detected
					y_next<= s1;
					outp <= '0';
				else
					y_next <= rst;
					outp <= '0';
				end if;
			when s1=>
				if (unsigned(inp)=21) then --t has been detected
					y_next<= s2;
					outp <= '0';
				else
					y_next <= s1;
					outp <= '0';
				end if;
			when s2=>
				if (unsigned(inp)=14) then --s has been detected
					y_next<= rst;
					outp <= '1';
				else
					y_next <= s2;
					outp <= '0';
				end if;
		end case;
	end process;	
end bhv;