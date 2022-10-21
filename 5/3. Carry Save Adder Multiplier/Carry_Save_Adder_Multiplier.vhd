library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Carry_Save_Adder_Multiplier is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
P : out STD_LOGIC_VECTOR (7 downto 0));
end Carry_Save_Adder_Multiplier;
 
architecture Behavioral of Carry_Save_Adder_Multiplier is
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
signal internal : STD_LOGIC_VECTOR (16 downto 0);
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
 HA0: half_adder port map(internal0(1), internal1(0), P(1), internal(0)) ;
 HA1: half_adder port map(internal0(2), internal1(1), internal(1), internal(2));
 HA2: half_adder port map(internal0(3), internal1(2), internal(3), internal(4));

 FA0: full_adder port map(internal2(0), internal(0), internal(1), P(2), internal(5));
 FA1: full_adder port map(internal2(1), internal(2), internal(3), internal(6), internal(7));
 FA2: full_adder port map(internal2(2), internal(4), internal1(3), internal(8), internal(9));

 FA3: full_adder port map(internal3(0), internal(5), internal(6), P(3), internal(10));
 FA4: full_adder port map(internal3(1), internal(7), internal(8), internal(11), internal(12));
 FA5: full_adder port map(internal3(2), internal(9), internal2(3), internal(13), internal(14));

 HA3: half_adder port map(internal(10), internal(11), P(4), internal(15));
 FA6: full_adder port map(internal(15), internal(12), internal(13), P(5), internal(16));
 FA7: full_adder port map(internal(16), internal(14), internal3(3), P(6), P(7)); 

end Behavioral;
