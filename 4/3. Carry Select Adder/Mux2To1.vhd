Library IEEE;
use IEEE.std_logic_1164.all;

entity Mux2To1 is
port( A : in std_logic;
      B : in std_logic;
      sel : in std_logic;
      Z : out std_logic);
end Mux2To1;

Architecture behavioral of Mux2To1 is
begin 
process (A,B,sel)
	begin
		if sel = '0' then
			Z <= A;
		else 
			Z <= B;
		end if;
end process;
end behavioral;