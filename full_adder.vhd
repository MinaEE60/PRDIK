library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
Port (
	a : in std_logic_vector (1 downto 0);
	cin : in std_logic;
	s, cout : out std_logic
);
end full_adder;

architecture beh of full_adder is 

-- definisanje signala i komponenata

begin

	s <= a(0) xor a(1) xor cin;
	cout <= (a(0) and a(1)) or (a(1) and cin) or (cin and a(0));

end beh;
