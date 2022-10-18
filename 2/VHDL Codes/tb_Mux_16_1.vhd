library IEEE;
use IEEE.std_logic_1164.all;
entity tb_Mux_16_1 is 
end entity tb_Mux_16_1;
Architecture behavioral of tb_Mux_16_1 is
component Mux_16_1 is
 Port(
 s : in std_logic_vector(3 downto 0);
 input: in std_logic_vector(15 downto 0);
 O : out std_logic
 );
End component Mux_16_1;
signal s : std_logic_vector(3 downto 0);
signal input: std_logic_vector(15 downto 0);
signal O : std_logic;
Begin
 u : Mux_16_1 port map (s=>s, input=>input, O=>O);
 s(3 downto 0) <= "0001", "0100" after 100ns;
 input(15 downto 0) <= "0000000000010010", "0000000000100000" after 200ns;
End behavioral;
