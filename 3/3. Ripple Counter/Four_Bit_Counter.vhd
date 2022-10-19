library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Four_Bit_Counter is
 Port ( 
  clk : in STD_LOGIC;
  Q : out STD_LOGIC_VECTOR (3 downto 0)
 );
end Four_Bit_Counter;
architecture gatelevel of Four_Bit_Counter is
component TFF
Port(
 clk,t,rst : in std_logic;
 Q: out std_logic;
 Qnot : out std_logic
 );
end component;
signal all_T, S0, S1, S2, S3, internal_ck : STD_LOGIC;
signal rst0,rst1,rst2,rst3 : std_logic := '0';
begin
all_T <= '1';
rst0 <= '1' after 100ns;
rst1 <= '1' after 200ns;
rst2 <= '1' after 400ns;
rst3 <= '1' after 800ns;
TFF0: tff port map (clk,all_T,rst0, Q(0), S0);
TFF1: tff port map (S0,all_T, rst1, Q(1), S1);
TFF2: tff port map (S1,all_T, rst2, Q(2), S2);
TFF3: tff port map (S2,all_T, rst3, Q(3), S3);
end gatelevel;
