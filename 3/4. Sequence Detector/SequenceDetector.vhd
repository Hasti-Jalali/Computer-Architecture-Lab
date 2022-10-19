library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SequenceDetector is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC);
end SequenceDetector;

architecture Behavioral of SequenceDetector is
	signal current_state : STD_LOGIC_VECTOR (2 downto 0);
begin
detector_process : process(clk, rst)
begin
if rst = '0' then
current_state <= "000";
output <= '0';
elsif (rising_edge(clk) and (clk'Event)) then
case current_state is
when "000" =>
	if input = '1' then
		current_state <= "001";
		output <= '0';
	else
		current_state <= "000";
		output <= '0';
	end if;
when "001" =>
	if input = '1' then
		current_state <= "010";
		output <= '0';
	else
		current_state <= "000";
		output <= '0';
	end if;
when "010" =>
	if input = '0' then
		current_state <= "011";
		output <= '0';
	else
		current_state <= "010";
		output <= '0';
	end if;
when "011" =>
	if input = '1' then
		current_state <= "100";
		output <= '1';
	else
		current_state <= "000";
		output <= '0';
	end if;
when "100" =>
	if input = '0' then
		current_state <= "000";
		output <= '0';
	else
		current_state <= "010";
		output <= '0';
	end if;
when others => current_state <= "000";
end case;
end if;
end process;
end Behavioral;

