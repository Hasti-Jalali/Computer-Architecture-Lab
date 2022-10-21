library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Carry_Save_Adder_Multiplier is 
end entity tb_Carry_Save_Adder_Multiplier;
Architecture behavioral of tb_Carry_Save_Adder_Multiplier is
component Carry_Save_Adder_Multiplier is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 P : out STD_LOGIC_VECTOR (7 downto 0));
End component Carry_Save_Adder_Multiplier;

signal A,B: STD_LOGIC_VECTOR (3 downto 0);
signal P: STD_LOGIC_VECTOR (7 downto 0);
Begin
 u : Carry_Save_Adder_Multiplier port map (A=>A, B=>B, P=>P);
 process is 
  begin
   A <= "0101";
   B <= "1001";
  wait for 50ns;
   A <= "1101";
   B <= "0011";
  wait for 50ns;
   A <= "0101";
   B <= "1110";
  wait for 50ns;
 end process;

End behavioral;

