library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity johnson_tb is
end johnson_tb;

architecture beh of johnson_tb is 

component johnson 
Port (
	Q : out std_logic_vector(2 downto 0);
	Q_n : out std_logic_vector(2 downto 0);
	clk : in std_logic
);
end component;

signal Q_s: std_logic_vector (2 downto 0);
signal Q_n_s: std_logic_vector (2 downto 0) := "001";
signal clk_s : std_logic := '1';

begin

uut : johnson Port map ( Q => Q_s,
			 Q_n => Q_n_s,
			 clk => clk_s);


clk_gen : process
		begin
			clk_s <= '1', '0' after 2 us;
			wait for 4 us;
		end process;

end;

