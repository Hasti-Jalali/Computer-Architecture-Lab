library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Delay is
port(
	clk_in : in std_logic;
	clk_out : out std_logic
);
end Delay;

architecture Behavioral of Delay is
signal counter : integer range 0 to 999 := 0;
signal temp : std_logic := '0';
begin
	
	process(clk_in)
	begin
		if(counter = 999) then
				temp <= not(temp);
				counter <= 0;
		else 
			counter <= counter + 1;
		end if;	
	end process;

	clk_out <= temp;

end Behavioral;

