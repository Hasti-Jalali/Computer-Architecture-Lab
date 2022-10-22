
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SevenSeg is
    Port ( Show : in  STD_LOGIC_VECTOR(3 downto 0);
           Result : out  STD_LOGIC_VECTOR(6 downto 0);
           Clock : in  STD_LOGIC);
end SevenSeg;

architecture Behavioral of SevenSeg is

begin

	process (Clock)
	begin
		if (Clock'event and Clock = '1') then
		case Show is               --abcdefg
			when "0000" => Result <= "1111110";
			when "0001" => Result <= "0110000";
			when "0010" => Result <= "1101101";
			when "0011" => Result <= "1111001";
			when "0100" => Result <= "0110011";
			when "0101" => Result <= "1011011";
			when "0110" => Result <= "1011111";
			when "0111" => Result <= "1110000";
			when "1000" => Result <= "1111111";
			when "1001" => Result <= "1110011";
			when "1010" => Result <= "1110111";
			when "1011" => Result <= "0011111";
			when "1100" => Result <= "1001110";
			when "1101" => Result <= "0111101";
			when "1110" => Result <= "1001111";
			when "1111" => Result <= "1000111";
			when others => Result <= "0000000";
		end case;
		end if;
	end process;

end Behavioral;