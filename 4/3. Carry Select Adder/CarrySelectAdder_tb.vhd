Library IEEE;
use IEEE.std_logic_1164.all;

entity CarrySelectAdder_tb is
end CarrySelectAdder_tb;

Architecture behavior of CarrySelectAdder_tb is
component CarrySelectAdder 
port( x : in std_logic_vector (3 downto 0) ;
      y : in std_logic_vector (3 downto 0) ;
      carry_in : in std_logic;
      carry_out : out std_logic;
      sum : out std_logic_vector (3 downto 0));
end component;

signal x: std_logic_vector (3 downto 0) := (others => '0');
signal y: std_logic_vector (3 downto 0) := (others => '0');
signal carry_in : std_logic := '1'; 
signal sum : std_logic_vector (3 downto 0);
signal carry_out : std_logic;

begin
uut : CarrySelectAdder port map(x => x, y=>y, carry_in => carry_in, carry_out=>carry_out, sum => sum);

proc : process
begin 
	wait for 100 ns;
	x <= "1011";
	y <= "0011";
	wait for 100 ns;
	x <= "1111";
	y <= "1111";
	wait for 100 ns;
	x <= "1010";
	y <= "0110";
	wait for 100 ns;
	x <= "1000";
	y <= "0100";
	wait;
end process;
end;

