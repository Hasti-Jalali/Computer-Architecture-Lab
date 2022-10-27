library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Dual_Port_RAM is
generic(
		width : integer := 4;
		c : integer := 4
	);
	port(
		WR, RD: in std_logic;
		Address_W,Address_R : in std_logic_vector(c - 1 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		Data_in : in std_logic_vector(width - 1 downto 0);
		Data_out : out std_logic_vector(width - 1 downto 0)
	);
end Dual_Port_RAM;

architecture Behavioral of Dual_Port_RAM is
Type DRam_Array is array ((2 ** c)-1 downto 0) of std_logic_vector(width-1 downto 0);
signal memory: DRam_Array;
begin

process(clk, reset)
	begin
		if(reset = '1') then
			for i in 0 to (2 ** c) - 1 loop
				memory(i) <= std_logic_vector(to_unsigned(0, width));
			end loop;
		elsif(clk'event and clk = '1') then
			if(wr='1') then
				memory(to_integer(unsigned(Address_W))) <= Data_in;
			end if;	
			if(rd='1' and wr = '0') then
				Data_out <= memory(to_integer(unsigned(Address_R)));
			elsif(rd = '1' and wr = '1') then
				if(Address_R = Address_W) then
					Data_out <= Data_in;
				else Data_out <= memory(to_integer(unsigned(Address_R)));
				end if;
			end if;
		end if;	
end process;	

end Behavioral;

