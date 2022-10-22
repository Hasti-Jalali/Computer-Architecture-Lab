library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_REG is
port(
	input : in std_logic_vector (3 downto 0);
	LR : in std_logic_vector (1 downto 0);
	Load : in std_logic;
	rst : in std_logic;
	clk : in std_logic;
	output : out std_logic_vector (3 downto 0)
);
end Shift_REG;

architecture Behavioral of Shift_REG is
begin

	process(clk, rst, Load)
	begin
	  if(rst = '1') then
		  output <= "0000";  
	  elsif(clk'event and clk = '1' and Load = '1') then
		 Case LR is
			when "00" => output <= input; --save data
			when "01" => output(2 downto 0) <= input(3 downto 1);
									 output(3) <= '0';
							 --SHR
			when "10" => output(2 downto 0) <= input(3 downto 1);
									 output(3) <=input(3);
							 --SAR
			when "11" => output(3 downto 1) <= input(2 downto 0);
									 output(0) <= '0';
							 --SAL & SHL
			when others => output <= "0000"; 
		 end Case;
	  end if;
	end process;

end Behavioral;

