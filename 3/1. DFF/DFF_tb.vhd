
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_tb is
end entity DFF_tb;



architecture Behavioral of DFF_tb is
component DFF is
    Port ( d,clk,rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component DFF;

signal clk,rst : STD_LOGIC :='0';
signal d : std_logic;
signal q : std_logic;



begin 
u : DFF port map(d => d, clk => clk, rst => rst, q => q);

 clk <= not clk after 50ns; --full period : 100ns

tb : process
begin
	rst <= '1';
	d <= '0';
	
	wait for 120 ns;
	d <= '1';
	wait for 100 ns;
	d <= '0';
	wait for 100 ns;
	d <= '1';
	wait for 100 ns;
	rst <= '0';
	Wait;
end process;

end;

