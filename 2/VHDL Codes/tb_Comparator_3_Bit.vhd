library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Comparator_3_Bit is 
end entity tb_Comparator_3_Bit;
Architecture behavioral of tb_Comparator_3_Bit is
component Comparator_3_Bit is
  Port(
 A, B: in std_logic_vector(2 downto 0);
 GT, EQ, LT: in std_logic;
 A_GT_B, A_EQ_B, A_LT_B : out std_logic
 );
End component Comparator_3_Bit;
signal  A, B: std_logic_vector(2 downto 0);
signal GT, EQ, LT: std_logic;
signal A_GT_B, A_EQ_B, A_LT_B : std_logic;
Begin
 u : Comparator_3_Bit port map (A=>A, B=>B, GT=>GT, EQ=>EQ,LT=>LT, A_GT_B=>A_GT_B, A_EQ_B=>A_EQ_B,A_LT_B=>A_LT_B);
 A <= "101", "001" after 100ns;
 B <= "100", "001" after 200ns;
 GT <= '0';
 LT <= '0';
 EQ <= '1';
End behavioral;
