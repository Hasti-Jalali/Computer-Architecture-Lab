library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Array_Multiplier is 
end entity tb_Array_Multiplier;
Architecture behavioral of tb_Array_Multiplier is
component Array_Multiplier is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 P : out STD_LOGIC_VECTOR (7 downto 0));
End component Array_Multiplier;

signal A,B: STD_LOGIC_VECTOR (3 downto 0);
signal P: STD_LOGIC_VECTOR (7 downto 0);
Begin
 u : Array_Multiplier port map (A=>A, B=>B, P=>P);
 process is 
  begin
   A <= "0101";
   B <= "1000";
  wait for 50ns;
   A <= "1101";
   B <= "0010";
  wait for 50ns;
   A <= "0100";
   B <= "1110";
  wait for 50ns;
 end process;

End behavioral;

