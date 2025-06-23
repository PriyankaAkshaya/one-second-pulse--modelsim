library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity 1sec is
    Port (
        clk     : in STD_LOGIC;
        reset   : in STD_LOGIC;
        one_sec_pulse : out STD_LOGIC
    );
end 1sec;

architecture Behavioral of 1sec is
    signal counter : INTEGER := 0;
    constant MAX_COUNT : INTEGER := 1000000; -- For 1 MHz clock
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            one_sec_pulse <= '0';
        elsif rising_edge(clk) then
            if counter = MAX_COUNT - 1 then
                counter <= 0;
                one_sec_pulse <= '1';
            else
                counter <= counter + 1;
                one_sec_pulse <= '0';
            end if;
        end if;
    end process;
end Behavioral;

