LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Shift_REG IS
END tb_Shift_REG;
 
ARCHITECTURE behavior OF tb_Shift_REG IS 
 
    COMPONENT Shift_REG
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         Load : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift_REG PORT MAP (
          input => input,
          LR => LR,
          Load => Load,
          rst => rst,
          clk => clk,
          output => output
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
      wait for 50 ns;
		Load <= '1';
		rst <= '0';
		input <= "1011";
		wait for 250 ns;
		LR <= "01";
		wait for 250 ns;
		LR <= "10";
		wait for 250 ns;
		LR <= "11";
      -- insert stimulus here 

      wait;
   end process;

END;
