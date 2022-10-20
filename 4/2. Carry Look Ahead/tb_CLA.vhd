library IEEE;
use IEEE.std_logic_1164.all;
entity tb_CLA is 
end entity tb_CLA;
Architecture behavioral of tb_CLA is
component Carry_Look_Ahead is
 Port (
  A : in STD_LOGIC_VECTOR (3 downto 0);
  B : in STD_LOGIC_VECTOR (3 downto 0);
  Cin : in STD_LOGIC;
  S : out STD_LOGIC_VECTOR (3 downto 0);
  Cout : out STD_LOGIC
);
End component Carry_Look_Ahead;
signal A,B: STD_LOGIC_VECTOR (3 downto 0);
signal Cin : std_logic;
signal S: STD_LOGIC_VECTOR (3 downto 0);
signal Cout : std_logic;
Begin
 u : Carry_Look_Ahead port map (A=>A, B=>B, Cin=>Cin, S=>S, Cout=>Cout);
 process is 
  begin
   A <= "0101";
   B <= "1000";
   Cin <= '0';
  wait for 50ns;
   A <= "1101";
   B <= "0010";
   Cin <= '0';
  wait for 50ns;
   A <= "0100";
   B <= "1110";
   Cin <= '0';
  wait for 50ns;
 end process;

End behavioral;
