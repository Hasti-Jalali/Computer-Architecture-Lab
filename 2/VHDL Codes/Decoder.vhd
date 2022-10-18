library IEEE;
use IEEE.std_logic_1164.all;
Entity Decoder is
 Port(
 i1,i0: in std_logic;
 O : out std_logic_vector (3 downto 0)
 );
End entity Decoder;
Architecture gatelevel of Decoder is
Begin
 O(0) <= not(i1) and not(i0);
 O(1) <= not(i1) and i0;
 O(2) <= i1 and not(i0);
 O(3) <= i1 and i0;
End gatelevel;
