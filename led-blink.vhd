LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;                     
USE IEEE.std_logic_unsigned.ALL;                   

ENTITY LED_ROTATE is
	PORT (clk : in STD_LOGIC; --50 MHz clock
		led1 : out STD_LOGIC_VECTOR (11 downto 0); --LEDs
	); --clock
END LED_ROTATE;
architecture behavioral of LED_ROTATE is

	signal clk_slow : std_logic;
begin
	proc_clk_slow : process( clk )
		variable clk_slow_counter : integer range 0 to 2499999;
	begin
		if rising_edge(clk) then
			clk_slow_counter := clk_slow_counter + 1;
			if(clk_slow_counter = 0) then
				clk_slow <= '1';
			else
				clk_slow <= '0';
			end if;
		end if ;
	end process ; -- proc_clk_slow

	 proc_led : process( clk_slow )
	 	variable index: integer range 0 to 12;
	 begin
		if rising_edge(clk_slow) then
			case index is 
				when 0 => led1 <= "000011111111";
				when 1 => led1 <= "000111111110";
				when 2 => led1 <= "001111111100";
				when 3 => led1 <= "011111111000";
				when 4 => led1 <= "111111110000";
				when 5 => led1 <= "111111100001";
				when 6 => led1 <= "111111000011";
				when 7 => led1 <= "111110000111";
				when 8 => led1 <= "111100001111";
				when 9 => led1 <= "111000011111";
				when 10 => led1 <="110000111111";
				when others => led1 <="100001111111"; --11
			end case ;
			if (index < 11) then
				index := index + 1;
			else 
				index := 0;
			end if;
		end if;
	end process ; -- proc_led
	


end behavioral ; -- behavioral