library ieee;
use ieee.std_logic_1164.all;

entity adder_4b is 
Port (
	a : in std_logic_vector (3 downto 0);
	b : in std_logic_vector (3 downto 0);
	cin : in std_logic;
	cout : out std_logic;
	s : out std_logic_vector (3 downto 0)
);
end adder_4b;


architecture struct of adder_4b is 

component full_adder
Port (
	a : in std_logic_vector (1 downto 0);
	cin : in std_logic;
	cout, s : out std_logic
);
end component;

signal cin3,cin2, cin1 : std_logic;

begin

	adder1 : full_adder Port map ( a(0) => a(3), 
				       a(1) => b(3),
				       cin => cin1,
			 	       s => s(3),
			 	       cout => cout);

	adder2 : full_adder Port map ( a(0) => a(2), 
				       a(1) => b(2),
				       cin => cin2,
			 	       s => s(2),
			 	       cout => cin1);

	adder3 : full_adder Port map ( a(0) => a(1), 
				       a(1) => b(1),
				       cin => cin3,
			 	       s => s(1),
			 	       cout => cin2);

	adder4 : full_adder Port map ( a(0) => a(0), 
				       a(1) => b(0),
				       cin => cin,
			 	       s => s(0),
			 	       cout => cin3);



end struct;
