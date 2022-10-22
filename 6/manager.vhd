library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity manager is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR(3 downto 0);
           Load : in  STD_LOGIC;
           LR : in  STD_LOGIC_VECTOR(1 downto 0);
           Result : out  STD_LOGIC_VECTOR(6 downto 0);
			  BinaryResult: out STD_LOGIC_VECTOR(3 downto 0);
			  clk_out : out STD_LOGIC
			  );
end manager;

architecture Behavioral of manager is
	
	component Delay is
    port    ( clk_in  : in   std_logic;
              clk_out  : out  std_logic);
	end component;
	
	component Shift_REG is
		port(
			input : in std_logic_vector (3 downto 0);
			LR : in std_logic_vector (1 downto 0);
			Load : in std_logic;
			rst : in std_logic;
			clk : in std_logic;
			output : out std_logic_vector (3 downto 0)
			);
	end component;
		
	component SevenSeg is
    Port ( Show : in  STD_LOGIC_VECTOR(3 downto 0);
           Result : out  STD_LOGIC_VECTOR(6 downto 0);
           Clock : in  STD_LOGIC);
	end component;

	Signal this_Clock: STD_LOGIC;
	Signal show: STD_LOGIC_VECTOR(3 downto 0);
	
begin

	freq_divider: Delay port map (Clock, this_Clock);
	shift: Shift_REG port map (Data,LR, Load, Reset, Clock, show);
	show_result: SevenSeg port map (show, Result, this_Clock);
	BinaryResult <= show;
	clk_out <= this_Clock;
	
end Behavioral;