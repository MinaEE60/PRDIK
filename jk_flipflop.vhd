library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is 
Port (
	J : in std_logic;
	K : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic
);
end jk_flipflop;

architecture beh of jk_flipflop is 

signal q_s: std_logic := '0';
signal qn_s : std_logic := '1';

begin

jkff : process (clk)
	begin
		if (clk'event and clk='1') then
			if ( J = '0' and K = '0') then
				q_s <= q_s;
				qn_s <= qn_s;
			elsif ( J = '0' and K = '1') then
				q_s <= '0';
				qn_s <= '1';
			elsif ( J = '1' and K = '0') then
				q_s <= '1';
				qn_s <= '0';
			else
				q_s <= qn_s;
				qn_s <= q_s;
			end if;
		end if;
	end process;

q <= q_s;
q_n <= qn_s;

end beh;
