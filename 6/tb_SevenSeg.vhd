LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_SevenSeg IS
END tb_SevenSeg;
 
ARCHITECTURE behavior OF tb_SevenSeg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenSeg
    PORT(
         Show : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(6 downto 0);
         Clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Show : std_logic_vector(3 downto 0) := (others => '0');
   signal Clock : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenSeg PORT MAP (
          Show => Show,
          Result => Result,
          Clock => Clock
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Show <= "0000";
      wait for 100 ns;
		Show <= "0010";

      -- insert stimulus here 

      wait;
   end process;

END;
