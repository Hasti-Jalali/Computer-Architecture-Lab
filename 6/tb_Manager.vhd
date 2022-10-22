LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_Manager IS
END tb_Manager;
 
ARCHITECTURE behavior OF tb_Manager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT manager
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Data : IN  std_logic_vector(3 downto 0);
         Load : IN  std_logic;
         LR : IN  std_logic_vector(1 downto 0);
         Result : OUT  std_logic_vector(6 downto 0);
			BinaryResult: out STD_LOGIC_VECTOR(3 downto 0);
			clk_out : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '1';
   signal Data : std_logic_vector(3 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal LR : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
	signal clk_out :  STD_LOGIC;
   signal Result : std_logic_vector(6 downto 0);
	signal BinaryResult: STD_LOGIC_VECTOR(3 downto 0);
   -- Clock period definitions
   constant Clock_period : time := 1 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: manager PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Data => Data,
          Load => Load,
          LR => LR,
          Result => Result,
			 BinaryResult => BinaryResult,
			 clk_out => clk_out
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
      wait for 10 ns;	
		Load <= '1';
		Reset <= '0';
		Data <= "1101";
		LR <= "00";
      wait for 2000 ms;
		LR <= "01";
		wait for 2000 ms;
		LR <= "10";
		wait for 2000 ms;
		LR <= "11";
      -- insert stimulus here 

      wait;
   end process;

END;
