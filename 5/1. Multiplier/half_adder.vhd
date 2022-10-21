library ieee;
use ieee.std_logic_1164.all;
entity half_adder is 
 Port(
  in1, in2: in std_logic;
 s, c : out std_logic
 ); 
end entity half_adder;
architecture structure of half_adder is 
begin
 s <= in1 xor in2;
 c <= in1 and in2;
end structure;