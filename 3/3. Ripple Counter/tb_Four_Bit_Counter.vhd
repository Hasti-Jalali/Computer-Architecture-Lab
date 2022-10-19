library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Four_Bit_Counter is 
end entity tb_Four_Bit_Counter;
Architecture behavioral of tb_Four_Bit_Counter is
component Four_Bit_Counter is
  Port ( 
  clk : in STD_LOGIC;
  Q : out STD_LOGIC_VECTOR (3 downto 0)
 );
End component Four_Bit_Counter;
signal clk : STD_LOGIC := '0';
signal Q : STD_LOGIC_VECTOR (3 downto 0);
Begin
 u : Four_Bit_Counter port map(clk=>clk,Q=>Q);
 clk <= not clk after 50ns; --full period : 100ns
End behavioral;
