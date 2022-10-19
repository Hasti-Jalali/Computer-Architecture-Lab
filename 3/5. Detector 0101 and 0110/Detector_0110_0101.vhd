library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Detector_0110_0101 is
port(
clk : in std_logic;
input : in std_logic ;
rst : in std_logic;
output_0110 : out std_logic;
output_0101 : out std_logic
);
end Detector_0110_0101;
architecture Behavioral of Detector_0110_0101 is
type state_t is (s0 , s1 , s2, s3, s4);
signal state_0110 : state_t := s0;
signal state_0101 : state_t := s0;
signal next_state_0110 : state_t := s0;
signal next_state_0101 : state_t := s0;
begin
REG : process(clk, rst)
begin
  if(rst = '0') then
     state_0110 <= s0;
     state_0101 <= s0;   
  elsif(clk'event and clk = '1') then
    state_0110 <= next_state_0110;
    state_0101 <= next_state_0101;
  end if;
end process;
prcs_0110 : process(state_0110 , input)
begin
  case state_0110 is
    when s0=>
      if(input = '0') then
         next_state_0110 <= s1;
      else
         next_state_0110 <= s0 ;
      end if;
     when s1=>
       if(input = '1') then
         next_state_0110 <= s2;
       else
	 next_state_0110 <= s1;
       end if;
     when s2=>
	if(input = '1') then
	 next_state_0110 <= s3;
       else
	 next_state_0110 <= s1;
	end if;
     when s3=>
	 if(input = '0') then
	 next_state_0110 <= s4;
       else
	 next_state_0110 <= s0;
	end if;
     when s4=>
	if(input = '1') then
	 next_state_0110 <= s2;
       else
	 next_state_0110 <= s1;
	end if;
     when others=>
	next_state_0110 <= s0;
end case;
end process;
prcs_0101 : process(state_0101 , input)
begin
  case state_0101 is
    when s0=>
      if(input = '0') then
         next_state_0101 <= s1;
      else
         next_state_0101 <= s0 ;
      end if;
     when s1=>
       if(input = '1') then
         next_state_0101 <= s2;
       else
	 next_state_0101 <= s1;
	end if;
     when s2=>
	if(input = '0') then
	 next_state_0101 <= s3;
       else
	 next_state_0101 <= s0;
	end if;
     when s3=>
	if(input = '1') then
	 next_state_0101 <= s4;
       else
	 next_state_0101 <= s1;
	end if;
     when s4=>
	if(input = '1') then
	 next_state_0101 <= s0;
        else
	 next_state_0101 <= s3;
	end if;
     when others=>
	next_state_0101 <= s0;
end case;
end process;
out_0110 : process (state_0110)
begin
    case state_0110 is
     when s0=>
       output_0110 <= '0';
     when s1=>
       output_0110 <= '0';
     when s2=>
	output_0110 <= '0';
     when s3=>
	output_0110 <= '0';
     when s4=>
	output_0110 <= '1';
  end case;
end process;
out_0101 : process (state_0101)
begin
    case state_0101 is
     when s0=>
       output_0101 <= '0';
     when s1=>
       output_0101 <= '0';
     when s2=>
	output_0101 <= '0';
     when s3=>
	output_0101 <= '0';
     when s4=>
	output_0101 <= '1';
  end case;
end process;
end Behavioral;

