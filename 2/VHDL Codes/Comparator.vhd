library IEEE;
use IEEE.std_logic_1164.all;
Entity Comparator is
 Port(
 A, B: in std_logic;
GT, EQ, LT: in std_logic;
 A_GT_B, A_EQ_B, A_LT_B : out std_logic
 );
End entity Comparator;
Architecture gatelevel of Comparator is
Begin
 A_EQ_B <= (A xnor B) and EQ;
 A_GT_B <= (A and not(B))or ((A xnor B) and GT);
 A_LT_B <= (not(A) and B) or ((A xnor B) and LT);
End gatelevel;
