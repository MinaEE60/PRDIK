library ieee;
use ieee.std_logic_1164.all;

entity flip is 
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic;
	set : in std_logic
);
end flip;

architecture beh of flip is 

signal q_t : std_logic := '0';
signal q_t_n : std_logic := '1';

begin

d_ff : process (clk, set)
	begin
		if (set = '1') then
			q_t <= '1';
			q_t_n <= '0';
		else
			if (clk'event and clk='1') then
				q_t <= D;
				q_t_n <= not D;
			end if;
		end if;
	end process;

q <= q_t;
q_n <= q_t_n;

end beh;
