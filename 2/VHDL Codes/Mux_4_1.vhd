library IEEE;
use IEEE.std_logic_1164.all;
Entity Mux_4_1 is
 Port(
 s0, s1: in std_logic;
 in0,in1,in2,in3: in std_logic;
 O : out std_logic
 );
End entity Mux_4_1;
Architecture gatelevel of Mux_4_1 is
signal s0not,s1not: std_logic;
Begin
 s0not <= not(s0);
 s1not <= not(s1);
 O <= (s0not and s1not and in0) or (s0not and s1 and in1) or (s0 and s1not and in2) or (s0 and s1 and in3);
End gatelevel;
