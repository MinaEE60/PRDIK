library ieee;
use ieee.std_logic_1164.all;

entity counter is 
Port (
	Q : out std_logic_vector(3 downto 0);
	clk : in std_logic;
	clear : in std_logic
);
end counter;


architecture struct of counter is 

component flip
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic;
	clear : in std_logic
);
end component;

signal d, d1, d2, d3 : std_logic;
signal Q_t : std_logic_vector(3 downto 0);

begin

	flip0 : flip Port map ( D => d,
				q => Q_t(0),
				q_n => d,
				clk => clk,
				clear => clear);

	flip1 : flip Port map ( D => d1,
				q => Q_t(1),
				q_n => d1,
				clk => Q_t(0),
				clear => clear);

	flip2 : flip Port map ( D => d2,
				q => Q_t(2),
				q_n => d2,
				clk => Q_t(1),
				clear => clear);

	flip3 : flip Port map ( D => d3,
				q => Q_t(3),
				q_n => d3,
				clk => Q_t(2),
				clear => clear);

Q <= Q_t;

end struct;
