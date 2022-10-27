LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_RAM IS
END tb_RAM;
 
ARCHITECTURE behavior OF tb_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         Address : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         Data_in : IN  std_logic_vector(3 downto 0);
			Data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Address : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
	signal Data_in : std_logic_vector(3 downto 0) := (others => '0');

	--Outputs
   signal Data_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          WR => WR,
          RD => RD,
          Address => Address,
          reset => reset,
          clk => clk,
          Data_in => Data_in,
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
      wait for 10 ns;
		reset <= '0';
		Data_in <= "1101";
		wr <= '1';
		address <= "0010";
      wait for 10 ns;
		Data_in <= "1001";
		address <= "0110";
      wait for 10 ns;
		wr <= '0';
		rd <= '1';
		address <= "0110";
		wait for 10 ns;
		address <= "0001";
		wait for 10 ns;
		address <= "0010";
		wait;
   end process;

END;
