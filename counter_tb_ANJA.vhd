library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture beh of counter_tb is 

component counter --kopiran deo kola koji se testira
Port (
	Q : out std_logic_vector(2 downto 0);
	Q_n : out std_logic_vector(2 downto 0);
	clk : in std_logic;
	set : in std_logic_vector(2 downto 0)
);
end component;

signal Q_s, Q_n_s, set_s : std_logic_vector (2 downto 0);
signal clk_s : std_logic;

begin

uut : counter Port map ( Q => Q_s,
			 Q_n => Q_n_s,
			 clk => clk_s,
			 set => set_s);


clk_gen : process
		begin
			clk_s <= '0', '1' after 1 us;
			wait for 2 us;
		end process;

set_s <= "001", "000"  after 1.5 us;

end;
