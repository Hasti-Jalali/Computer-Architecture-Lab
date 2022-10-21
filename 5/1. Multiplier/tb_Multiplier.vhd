library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Multiplier is 
end entity tb_Multiplier;
Architecture behavioral of tb_Multiplier is
component Multiplier is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 P : out STD_LOGIC_VECTOR (7 downto 0));
End component Multiplier;

signal A,B: STD_LOGIC_VECTOR (3 downto 0);
signal P: STD_LOGIC_VECTOR (7 downto 0);
Begin
 u : Multiplier port map (A=>A, B=>B, P=>P);
 process is 
  begin
   A <= "0101";
   B <= "1001";
  wait for 100ns;
   A <= "1101";
   B <= "0011";
  wait for 100ns;
   A <= "0101";
   B <= "1110";
  wait for 100ns;
 end process;

End behavioral;
