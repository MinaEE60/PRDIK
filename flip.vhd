library ieee;
use ieee.std_logic_1164.all;

entity flip is 
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic;
	clear : in std_logic
);
end flip;

architecture beh of flip is 

-- definisanje signala i komponenata

begin

d_ff : process (clk, clear)
	begin
		if (clear = '1') then
			q <= '1';
			q_n <= '0';
		else
			if (clk'event and clk='1') then
				q <= D;
				q_n <= not D;
			end if;
		end if;
	end process;

end beh;
