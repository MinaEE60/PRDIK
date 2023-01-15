library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_4b_tb is
end adder_4b_tb;

architecture beh of adder_4b_tb is 

component adder_4b --kopiran deo kola koji se testira
Port (
	a : in std_logic_vector (3 downto 0);
	b : in std_logic_vector (3 downto 0);
	cin : in std_logic;
	cout : out std_logic;
	s : out std_logic_vector (3 downto 0)
);
end component;

signal a_s, b_s, s_s : std_logic_vector (3 downto 0);
signal cout_s, cin_s : std_logic;

begin

uut : adder_4b Port map ( a => a_s,
			 b => b_s,
			 s => s_s,
			 cin => cin_s,
			 cout => cout_s);

a_s <= "0000", "0100" after 1 us, "1010" after 2 us, "1110" after 3 us, "0001" after 4 us;
b_s <= "1100", "0110" after 0.5 us, "0001" after 1.25 us, "1011" after 2.5 us, "0011" after 3.1 us;
cin_s <= '1', '0' after 2 us, '1' after 4 us;

end;
