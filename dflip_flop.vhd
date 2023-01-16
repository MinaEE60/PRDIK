library ieee;
use ieee.std_logic_1164.all;

entity dflip_flop is 
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic
);
end dflip_flop;

architecture beh of dflip_flop is 

signal q_s: std_logic := '0';
signal qn_s: std_logic := '1';

begin

d_ff : process (clk)
	begin
		if (clk'event and clk='1') then
			q_s <= D;
			qn_s <= not D;
		end if;
	end process;

q <= q_s;
q_n <= qn_s;

end beh;
