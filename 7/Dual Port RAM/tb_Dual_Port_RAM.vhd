LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Dual_Port_RAM IS
END tb_Dual_Port_RAM;
 
ARCHITECTURE behavior OF tb_Dual_Port_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dual_Port_RAM
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         Address_W : IN  std_logic_vector(3 downto 0);
         Address_R : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         Data_in : IN  std_logic_vector(3 downto 0);
         Data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Address_W : std_logic_vector(3 downto 0) := (others => '0');
   signal Address_R : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
   signal Data_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Data_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_Port_RAM PORT MAP (
          WR => WR,
          RD => RD,
          Address_W => Address_W,
          Address_R => Address_R,
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
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		reset <= '0';
		wr <= '1';
		Data_in <= "1111";
		Address_w <= "0010";
		rd <= '1';
		Address_r <= "0010";
      wait for clk_period;
		Data_in <= "1011";
		Address_w <= "0110";
		rd <= '0';
      wait for clk_period;
		Data_in <= "1001";
		Address_w <= "1000";
		rd <= '1';
		Address_r <= "0110";
      wait for clk_period;
		wr <= '0';
		Address_r <= "1000";

      -- insert stimulus here 

      wait;
   end process;

END;
