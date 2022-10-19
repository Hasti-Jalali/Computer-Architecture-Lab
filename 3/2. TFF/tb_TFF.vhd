library IEEE;
use IEEE.std_logic_1164.all;
entity tb_TFF is 
end entity tb_TFF;
Architecture behavioral of tb_TFF is
component TFF is
  Port(
  clk,t,rst : in std_logic;
  Q: out std_logic;
  Qnot : out std_logic
 );
End component TFF;
signal clk,rst : STD_LOGIC := '0';
signal t: std_logic;
signal Q,Qnot : std_logic;
Begin
 u : TFF port map(clk=>clk,t=>t,rst=>rst,Q=>Q,Qnot=>Qnot);
 clk <= not clk after 50ns; --full period : 100ns
 process is
    begin
        rst <= '1';
        t <= '1';
        wait for 100 ns;
        t <= '0';
        wait for 100 ns;
        t <= '1';
        wait for 100 ns;
 	t <= '1';
        wait for 100 ns;
        rst <= '0';
        wait;
    end process;
 
End behavioral;

