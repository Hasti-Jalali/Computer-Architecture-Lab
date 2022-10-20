Library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity carrySelectAdder is
port ( x : in std_logic_vector (3 downto 0);
       y : in std_logic_vector (3 downto 0);
       carry_in : in std_logic ;
       carry_out : out std_logic;
       sum : out std_logic_vector (3 downto 0));
end carrySelectAdder;

Architecture behavioral of CarrySelectAdder is

component Full_Adder
port( A : in std_logic;
      B : in std_logic;
      Cin : in std_logic;
      S,Cout : out std_logic);
end component;

component Mux2To1
port( A : in std_logic;
      B : in std_logic;
      sel : in std_logic;
      Z : out std_logic);
end component;

signal A,B,c0,c1 : std_logic_vector (3 downto 0);

begin 
	FA1 : Full_Adder port map(x(0), y(0), '0' , A(0), c0(0)); 
	FA2 : Full_Adder port map(x(1), y(1), c0(0), A(1), c0(1)); 
	FA3 : Full_Adder port map(x(2), y(2), c0(1), A(2), c0(2)); 
	FA4 : Full_Adder port map(x(3), y(3), c0(2), A(3), c0(3));

	FA5 : Full_Adder port map(x(0), y(0),  '1' , B(0),c1(0));  
	FA6 : Full_Adder port map(x(1), y(1), c1(0), B(1), c1(1)); 
	FA7 : Full_Adder port map(x(2), y(2), c1(1), B(2), c1(2)); 
	FA8 : Full_Adder port map(x(3), y(3), c1(2), B(3), c1(3)); 

	Mux1 : Mux2To1 port map(A(0),B(0),carry_in,sum(0));
	Mux2 : Mux2To1 port map(A(1),B(1),carry_in,sum(1));
	Mux3 : Mux2To1 port map(A(2),B(2),carry_in,sum(2));
	Mux4 : Mux2To1 port map(A(3),B(3),carry_in,sum(3));
	
	Mux5 : Mux2To1 port map(c0(3),c1(3),carry_in,carry_out);

end behavioral;

	