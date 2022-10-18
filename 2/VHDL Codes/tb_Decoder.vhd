library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Decoder is 
end entity tb_Decoder;
Architecture behavioral of tb_Decoder is
component Decoder is
 Port(
 i1,i0: in std_logic;
 O : out std_logic_vector (3 downto 0)
 );
End component Decoder;
signal i1,i0: std_logic;
signal O : std_logic_vector (3 downto 0);
Begin
 u : Decoder port map (i1=>i1, i0=>i0, O =>O);
 i1 <= '0','1' after 100ns;
 i0 <= '0','1' after 200ns;
End behavioral;
