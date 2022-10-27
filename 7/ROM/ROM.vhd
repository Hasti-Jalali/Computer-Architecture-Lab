library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
	generic(
		width : integer := 4;
		c : integer := 4
	);
	port(
		Address : in std_logic_vector(c - 1 downto 0);
		rst,clk : in std_logic;
		Data_out : out std_logic_vector(width-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
Type Rom_Array is array ((2 ** c)-1 downto 0) of std_logic_vector(width-1 downto 0);
signal memory: Rom_Array;
begin
process(rst) begin
	if(rst = '1') then
		for i in 0 to (2 ** c) - 1 loop
			memory(i) <= std_logic_vector(to_unsigned(i, width));
		end loop;
	end if;
end process;
process(clk)
begin
	if(clk'event and clk = '1') then
		Data_out <= memory(to_integer(unsigned(address)));
	end if;
end process;

end Behavioral;

