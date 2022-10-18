library IEEE;
use IEEE.std_logic_1164.all;
Entity Comparator_3_Bit is
 Port(
 A, B: in std_logic_vector(2 downto 0);
 GT, EQ, LT: in std_logic;
 A_GT_B, A_EQ_B, A_LT_B : out std_logic
 );
End entity Comparator_3_Bit;
Architecture gatelevel of Comparator_3_Bit is
component Comparator is 
Port(
 A, B: in std_logic;
 GT, EQ, LT: in std_logic;
 A_GT_B, A_EQ_B, A_LT_B : out std_logic
 );
end component Comparator;
signal GT_internal, EQ_internal, LT_internal: std_logic_vector(1 downto 0);
Begin
Comparator_inst1: Comparator port map (A=>A(0), B=>B(0), GT=>GT, EQ=>EQ,LT=>LT,A_GT_B=>GT_internal(0),A_EQ_B=>EQ_internal(0),A_LT_B=>LT_internal(0));

Comparator_inst2: Comparator port map (A=>A(1), B=>B(1), GT=>GT_internal(0), EQ=>EQ_internal(0),LT=>LT_internal(0),A_GT_B=>GT_internal(1),A_EQ_B=>EQ_internal(1),A_LT_B=>LT_internal(1));

Comparator_inst3: Comparator port map (A=>A(2), B=>B(2), GT=>GT_internal(1), EQ=>EQ_internal(1),LT=>LT_internal(1),A_GT_B=>A_GT_B,A_EQ_B=>A_EQ_B,A_LT_B=>A_LT_B);

End gatelevel;
