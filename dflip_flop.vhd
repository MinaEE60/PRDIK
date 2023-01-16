library ieee;
use ieee.std_logic_1164.all;

entity dflip_flop is 
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic;
);
end dflip_flop;

architecture beh of dflip_flop is 

-- definisanje signala i komponenata

begin

d_ff : process (clk)
	begin
		if (clk'event and clk='1') then
			q <= D;
			q_n <= not D;
		end if;
	end process;

end beh;
