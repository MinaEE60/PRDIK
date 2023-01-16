library ieee;
use ieee.std_logic_1164.all;

entity brojac is 
Port (
	Q : out std_logic_vector(2 downto 0);
	Q_n : out std_logic_vector(2 downto 0);
	clk : in std_logic
);
end brojac;


architecture struct of brojac is 

component jk_flipflop
Port (
	J : in std_logic;
	K : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic
);
end component;

signal Q_t : std_logic_vector(2 downto 0);
signal Q_t_n : std_logic_vector(2 downto 0);
signal Vdd : std_logic := '1';

begin

	jkff1: jk_flipflop Port map ( J => Vdd,
				      K => Vdd,
				      q => Q_t(0),
				      q_n => Q_t_n(0),
				      clk => clk);

	jkff2 : jk_flipflop Port map ( J => Vdd,
				       K => Vdd,
				       q => Q_t(1),
				       q_n => Q_t_n(1),
				       clk => not Q_t(0));

	jkff3 : jk_flipflop Port map ( J => Vdd,
				       K => Vdd,
				       q => Q_t(2),
				       q_n => Q_t_n(2),
				       clk => not Q_t(1));

Q <= Q_t;
Q_n <= Q_t_n;

end struct;
