library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Carry_Look_Ahead is
Port (
A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end Carry_Look_Ahead;
 
architecture Behavioral of Carry_Look_Ahead is
 
component Full_Adder
 Port(
 A, B, Cin: in std_logic;
 S, Cout : out std_logic
 ); 
end component;
 
  signal w_G : std_logic_vector(3 downto 0); -- Generate
  signal w_P : std_logic_vector(3 downto 0); -- Propagate
  signal w_C : std_logic_vector(4 downto 0); -- Carry
 
  signal w_SUM   : std_logic_vector(3 downto 0);
 
   
begin
   
  FULL_ADDER_BIT_0 : full_adder
    port map (A  => A(0), B => B(0), Cin => w_C(0), S => w_SUM(0), Cout => open);
 
  FULL_ADDER_BIT_1 : full_adder
    port map (A  => A(1), B => B(1), Cin => w_C(1), S => w_SUM(1), Cout => open);
 
  FULL_ADDER_BIT_2 : full_adder
    port map (A  => A(2), B => B(2), Cin => w_C(2), S => w_SUM(2), Cout => open);
   
  FULL_ADDER_BIT_3 : full_adder
    port map (A  => A(3), B => B(3), Cin => w_C(3), S => w_SUM(3), Cout => open);
 
  -- Create the Generate (G) Terms:  Gi=Ai*Bi
  w_G(0) <= A(0) and B(0);
  w_G(1) <= A(1) and B(1);
  w_G(2) <= A(2) and B(2);
  w_G(3) <= A(3) and B(3);
 
  -- Create the Propagate Terms: Pi=Ai+Bi
  w_P(0) <= A(0) or B(0);
  w_P(1) <= A(1) or B(1);
  w_P(2) <= A(2) or B(2);
  w_P(3) <= A(3) or B(3);
 
  -- Create the Carry Terms:
  w_C(0) <= '0'; -- no carry input
  w_C(1) <= w_G(0) or (w_P(0) and w_C(0));
  w_C(2) <= w_G(1) or (w_P(1) and w_C(1));
  w_C(3) <= w_G(2) or (w_P(2) and w_C(2));
  w_C(4) <= w_G(3) or (w_P(3) and w_C(3));
 
  -- Final Answer
  
  S <= w_SUM;
  Cout <= w_C(4);
   
end Behavioral;
