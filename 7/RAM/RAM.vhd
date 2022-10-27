library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
	generic(
		width : integer := 4;
		c : integer := 4
	);
	port(
		WR, RD: in std_logic;
		Address : in std_logic_vector(c - 1 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		Data_in : in std_logic_vector(width - 1 downto 0);
		Data_out : out std_logic_vector(width - 1 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
Type Ram_Array is array ((2 ** c)-1 downto 0) of std_logic_vector(width-1 downto 0);
signal memory: Ram_Array;
begin
process(clk, reset)
	begin
		if(reset = '1') then
			for i in 0 to (2 ** c) - 1 loop
				memory(i) <= std_logic_vector(to_unsigned(0, width));
			end loop;
		elsif(clk'event and clk = '1') then
			if(wr='1' and rd='0') then
				memory(to_integer(unsigned(address))) <= Data_in;
			elsif(rd='1' and wr='0') then
				Data_out <= memory(to_integer(unsigned(address)));
			end if;
		end if;	
end process;			
end Behavioral;

