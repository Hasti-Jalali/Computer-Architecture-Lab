library ieee;
use ieee.std_logic_1164.all;
entity half_adder is 
 Port(
  in1, in2: in std_logic;
 out1, out2 : out std_logic
 ); 
end entity half_adder;
architecture structure of half_adder is 
begin
 out1 <= in1 xor in2;
 out2 <= in1 and in2;
end structure;