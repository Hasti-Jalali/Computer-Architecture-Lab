library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Array_Multiplier is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
P : out STD_LOGIC_VECTOR (7 downto 0));
end Array_Multiplier;
 
architecture Behavioral of Array_Multiplier is
component Ripple_Adder
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end component;

signal internal0,internal1,internal2,internal3, internal: STD_LOGIC_VECTOR (3 downto 0);
signal RAinternal0, RAinternal1, RAinternal2 : STD_LOGIC_VECTOR (4 downto 0);
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
 internal <= '0' & internal0(3 downto 1);
 RA0: Ripple_Adder port map (internal, internal1(3 downto 0), '0',
RAinternal0(3 downto 0), RAinternal0(4));
 P(1) <= RAinternal0(0);
 RA1: Ripple_Adder port map (RAinternal0(4 downto 1), internal2(3 downto 0), '0', 
RAinternal1(3 downto 0), RAinternal1(4));
 P(2) <= RAinternal1(0);
 RA2: Ripple_Adder port map (RAinternal1(4 downto 1), internal3(3 downto 0), '0', 
RAinternal2(3 downto 0), RAinternal2(4));
 P(7 downto 3) <= RAinternal2;

end Behavioral;
