library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture beh of counter_tb is 

component counter --kopiran deo kola koji se testira
Port (
	Q : out std_logic_vector(3 downto 0);
	clk : in std_logic;
	clear : in std_logic
);
end component;

signal Q_s: std_logic_vector (3 downto 0);
signal clk_s, clear_s : std_logic;

begin

uut : counter Port map ( Q => Q_s,
			 clk => clk_s,
			 clear => clear_s);


clk_gen : process
		begin
			clk_s <= '0', '1' after 1 us;
			wait for 4 us;
		end process;

clear_s <= '1', '0' after 0.5 us, '1' after 3 us, '0' after 3.1 us;

end;
