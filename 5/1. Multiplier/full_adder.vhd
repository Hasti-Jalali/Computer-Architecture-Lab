library ieee;
use ieee.std_logic_1164.all;
entity full_adder is 
 Port(
 A, B, Cin: in std_logic;
 S, Cout : out std_logic
 ); 
end entity full_adder;
architecture structure of full_adder is 
component half_adder is 
Port(
 in1, in2: in std_logic;
 s, c : out std_logic
); 
end component half_adder;
signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin
 half_adder_instance0: half_adder port map ( in1 => A, in2 => B, s => internal_signal0, c => 
internal_signal1);
 half_adder_instance1: half_adder port map ( in1 => internal_signal0, in2 => Cin, s => S, c => 
internal_signal2);
 Cout <= internal_signal1 or internal_signal2;
end structure;
