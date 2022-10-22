LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Delay IS
END tb_Delay;
 
ARCHITECTURE behavior OF tb_Delay IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Delay
    PORT(
         clk_in : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 1 ms;
   --constant clk_out_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Delay PORT MAP (
          clk_in => clk_in,
          clk_out => clk_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
--   clk_out_process :process
--   begin
--		clk_out <= '0';
--		wait for clk_out_period/2;
--		clk_out <= '1';
--		wait for clk_out_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clk_in_period*1000;

      -- insert stimulus here 

      wait;
   end process;

END;
