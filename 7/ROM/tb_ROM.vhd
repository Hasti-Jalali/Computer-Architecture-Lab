LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_ROM IS
END tb_ROM;
 
ARCHITECTURE behavior OF tb_ROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         Address : IN  std_logic_vector(3 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         Data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(3 downto 0) := (others => '0');
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          Address => Address,
          rst => rst,
          clk => clk,
          Data_out => Data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	   address <= "0000";
      wait for clk_period;
		address <= "0010";
      wait for clk_period;
		address <= "1010";
      wait for clk_period;
      -- insert stimulus here 

      wait;
   end process;

END;
