library IEEE;
use IEEE.std_logic_1164.all;
Entity Encoder is
 Port(
 i0,i1,i2,i3: in std_logic;
 A1,A0,V : out std_logic
 );
End entity Encoder;
Architecture gatelevel of Encoder is
Begin
 A1 <= i2 or i3;
 A0 <= i3 or (i1 and not(i2));
 V <= i0 or i1 or i2 or i3;
End gatelevel;
