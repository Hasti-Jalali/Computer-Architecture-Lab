library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Encoder is 
end entity tb_Encoder;
Architecture behavioral of tb_Encoder is
component Encoder is
 Port(
 i0,i1,i2,i3: in std_logic;
 A1,A0,V : out std_logic
 );
End component Encoder;
signal i0,i1,i2,i3: std_logic;
signal A1,A0,V : std_logic;
Begin
 u : Encoder port map (i0=>i0, i1=>i1, i2=>i2, i3=>i3, A1=>A1, A0=>A0, V=>V);
 i0 <= '0','1' after 100ns;
 i1 <= '0', '1' after 200ns;
 i2 <= '0', '1' after 300ns;
 i3 <= '0', '1' after 400ns;
End behavioral;
