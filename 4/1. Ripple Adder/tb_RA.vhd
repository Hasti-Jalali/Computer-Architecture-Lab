library IEEE;
use IEEE.std_logic_1164.all;
entity tb_RA is 
end entity tb_RA;
Architecture behavioral of tb_RA is
component Ripple_Adder is
 Port (
  A : in STD_LOGIC_VECTOR (3 downto 0);
  B : in STD_LOGIC_VECTOR (3 downto 0);
  Cin : in STD_LOGIC;
  S : out STD_LOGIC_VECTOR (3 downto 0);
  Cout : out STD_LOGIC
);
End component Ripple_Adder;
signal A,B: STD_LOGIC_VECTOR (3 downto 0);
signal Cin : std_logic;
signal S: STD_LOGIC_VECTOR (3 downto 0);
signal Cout : std_logic;
Begin
 u : Ripple_Adder port map (A=>A, B=>B, Cin=>Cin, S=>S, Cout=>Cout);
 process is 
  begin
   A <= "1001";
   B <= "1000";
   Cin <= '0';
  wait for 50ns;
   A <= "1101";
   B <= "0110";
   Cin <= '0';
  wait for 50ns;
   A <= "0100";
   B <= "0010";
   Cin <= '0';
  wait for 50ns;
 end process;

End behavioral;
