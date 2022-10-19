library IEEE;
use IEEE.std_logic_1164.all;
Entity TFF is
 Port(
 clk,t,rst : in std_logic;
 Q: out std_logic;
 Qnot : out std_logic
 );
End entity TFF;
Architecture gatelevel of TFF is
 signal op: std_logic;                           
begin                                              
   process(clk, rst) is
    begin
      if (rst = '0') then
          op <= '0';
      elsif (clk'event and clk='1' ) then
          if(t = '1') then 
	      op <= not op;
          else op <= op;
          end if;
     end if;
   end process;
   Q <= op;
   Qnot <= not op;      
End gatelevel;