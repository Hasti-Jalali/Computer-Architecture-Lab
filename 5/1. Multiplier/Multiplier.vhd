library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Multiplier is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
P : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier;
 
architecture Behavioral of Multiplier is
component half_adder
 Port(
  in1, in2: in std_logic;
 s, c : out std_logic
 ); 
end component;
component full_adder
 Port(
 A, B, Cin: in std_logic;
 S, Cout : out std_logic
 ); 
end component;

signal internal0,internal1,internal2,internal3: STD_LOGIC_VECTOR (3 downto 0);
signal internalC : STD_LOGIC_VECTOR (10 downto 0);
signal internalS: STD_LOGIC_VECTOR (5 downto 0);
begin
 internal0(0) <= A(0) and B(0);
 internal0(1) <= A(1) and B(0);
 internal0(2) <= A(2) and B(0);
 internal0(3) <= A(3) and B(0);

 internal1(0) <= A(0) and B(1);
 internal1(1) <= A(1) and B(1);
 internal1(2) <= A(2) and B(1);
 internal1(3) <= A(3) and B(1);

 internal2(0) <= A(0) and B(2);
 internal2(1) <= A(1) and B(2);
 internal2(2) <= A(2) and B(2);
 internal2(3) <= A(3) and B(2);

 internal3(0) <= A(0) and B(3);
 internal3(1) <= A(1) and B(3);
 internal3(2) <= A(2) and B(3);
 internal3(3) <= A(3) and B(3);
 
 P(0) <= internal0(0);
 HA0: half_adder port map(internal0(1), internal1(0), P(1), internalC(0)) ;
 FA0: full_adder port map(internalC(0), internal0(2), internal1(1), internalS(0), internalC(1));
 FA1: full_adder port map(internalC(1), internal0(3), internal1(2), internalS(1), internalC(2));
 HA1: half_adder port map(internalC(2), internal1(3), internalS(2), internalC(3));

 HA2: half_adder port map(internal2(0), internalS(0), P(2), internalC(4));
 FA2: full_adder port map(internalC(4), internal2(1), internalS(1), internalS(3), internalC(5));
 FA3: full_adder port map(internalC(5), internal2(2), internalS(2), internalS(4), internalC(6));
 FA4: full_adder port map(internalC(6), internal2(3), internalC(2), internalS(5), internalC(7));
 
 HA3: half_adder port map(internal3(0), internalS(3), P(3), internalC(8));
 FA5: full_adder port map(internalC(8), internal3(1), internalS(4), P(4), internalC(9));
 FA6: full_adder port map(internalC(9), internal3(2), internalS(5), P(5), internalC(10));
 FA7: full_adder port map(internalC(10), internal3(3), internalC(7), P(6), P(7));

 
end Behavioral;
