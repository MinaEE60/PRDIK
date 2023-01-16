library ieee;
use ieee.std_logic_1164.all;

entity johnson is 
Port (
	Q : out std_logic_vector(2 downto 0);
	Q_n : out std_logic_vector(2 downto 0);
	clk : in std_logic
);
end johnson;


architecture struct of johnson is 

component dflip_flop
Port (
	D : in std_logic;
	q : out std_logic;
	q_n : out std_logic;
	clk : in std_logic
);
end component;

signal Q_t : std_logic_vector(2 downto 0);
signal Q_t_n : std_logic_vector(2 downto 0) := "001";

begin

	dff1 : dflip_flop Port map ( D => Q_t_n(0),
				     q => Q_t(2),
				     q_n => Q_t_n(2),
				     clk => clk);

	dff2 : dflip_flop Port map ( D => Q_t(2),
				     q => Q_t(1),
				     q_n => Q_t_n(1),
				     clk => clk);

	dff3 : dflip_flop Port map ( D => Q_t(1),
				     q => Q_t(0),
				     q_n => Q_t_n(0),
				     clk => clk);
Q <= Q_t;
Q_n <= Q_t_n;

end struct;
