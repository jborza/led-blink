LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;                     
USE IEEE.std_logic_unsigned.ALL;                   

ENTITY LED_ROTATE is
	PORT (clk : in STD_LOGIC; --50 MHz clock
		led1 : out STD_LOGIC_VECTOR (11 downto 0) --LEDs
	); --clock
END LED_ROTATE;
architecture behavioral of LED_ROTATE is

	signal clk_slow : std_logic;
	

begin
	proc_clk_slow : process( clk )
		variable clk_slow_counter : integer range 0 to 999999;
	begin
		if rising_edge(clk) then
			clk_slow_counter := clk_slow_counter + 1;
			if(clk_slow_counter = 0) then
				clk_slow <= '1';
			else
				clk_slow <= '0';
			end if;
		end if ;
	end process ; -- p1

	-- proc_led : process( clk_slow )
	-- 	variable index: integer range 0 to 16;
	-- begin
	-- 	if index
	-- end process ; -- proc_led
led1<="111111111110";

end behavioral ; -- behavioral