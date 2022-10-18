library IEEE;
use IEEE.std_logic_1164.all;
Entity Mux_16_1 is
 Port(
 s : in std_logic_vector(3 downto 0);
 input: in std_logic_vector(15 downto 0);
 O : out std_logic
 );
End entity Mux_16_1;
Architecture gatelevel of Mux_16_1 is
component Mux_4_1 is 
Port(
 s0, s1: in std_logic;
 in0,in1,in2,in3: in std_logic;
 O : out std_logic
 );
end component Mux_4_1;
signal internal: std_logic_vector(3 downto 0);
Begin
Mux_4_1_inst1: Mux_4_1 port map (s0=>s(1), s1=>s(0), in0=>input(0), in1=>input(1), in2=>input(2), in3=>input(3), O=>internal(0));
Mux_4_1_inst2: Mux_4_1 port map (s0=>s(1), s1=>s(0), in0=>input(4), in1=>input(5), in2=>input(6), in3=>input(7), O=>internal(1));
Mux_4_1_inst3: Mux_4_1 port map (s0=>s(1), s1=>s(0), in0=>input(8), in1=>input(9), in2=>input(10), in3=>input(11), O=>internal(2));
Mux_4_1_inst4: Mux_4_1 port map (s0=>s(1), s1=>s(0), in0=>input(12), in1=>input(13), in2=>input(14), in3=>input(15), O=>internal(3));
Mux_4_1_inst5: Mux_4_1 port map (s0=>s(3), s1=>s(2), in0=>internal(0), in1=>internal(1), in2=>internal(2), in3=>internal(3), O=>O);
End gatelevel;