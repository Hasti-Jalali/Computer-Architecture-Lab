
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port ( d,clk,rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
	process(clk,rst)
 begin 
     if(rst='0') then 
   q <= '0';
     elsif(clk = '1' and clk'EVENT) then
   q <= D; 
  end if;      
 end process;  

end Behavioral;
