library IEEE;
use IEEE.std_logic_1164.all;
entity sequence_tb is 
end entity sequence_tb;
Architecture behavioral of sequence_tb is
component sequenceDetector is
  port(
input : in std_logic ;
clk : in std_logic;
rst : in std_logic;
output : out std_logic
  );
End component sequenceDetector;
signal clk,rst,input : STD_LOGIC := '0';
signal detected: STD_LOGIC;
Begin
 u : sequenceDetector port map(input=>input,clk=>clk,rst=>rst,output=>detected);
 clk <= not clk after 50ns; --full period : 100ns
process is
    begin
	input <= '0';
        rst <= '1';
        wait for 100 ns;
        input <= '0';
        wait for 100 ns;
        input <= '1';
        wait for 100 ns;
 	input <= '1';
        wait for 100 ns;
	input <= '0';
        wait for 100 ns;
 	input <= '1';
        wait for 100 ns;
	input <= '0';
        wait for 100 ns;
 	input <= '1';
        wait for 150 ns;
        rst <= '0';
        wait;
    end process;
End behavioral;