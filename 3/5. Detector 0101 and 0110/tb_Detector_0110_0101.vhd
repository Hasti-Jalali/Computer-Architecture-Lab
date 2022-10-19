library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Detector_0110_0101 is 
end entity tb_Detector_0110_0101;
Architecture behavioral of tb_Detector_0110_0101 is
component Detector_0110_0101 is
  port(
clk : in std_logic;
input : in std_logic ;
rst : in std_logic;
output_0110 : out std_logic;
output_0101 : out std_logic
  );
End component Detector_0110_0101;
signal clk,rst,input : STD_LOGIC := '0';
signal output_0110,output_0101: STD_LOGIC;
Begin
 u : Detector_0110_0101 port map(clk=>clk,input=>input,rst=>rst,output_0110=>output_0110,output_0101=>output_0101);
 clk <= not clk after 50ns; --full period : 100ns
process is
    begin
	input <= '0';
        rst <= '1';
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
        wait for 100 ns;
	input <= '1';
        wait for 100 ns;
 	input <= '0';
        wait for 150 ns;
        rst <= '0';
        wait;
    end process;
End behavioral;
