library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity i2s_generator_agent is 
begin
generic (
    bit_rate : integer := 441000;
    bit_depth : integer := 16
);
port (
    word_select : std_logic;
    clk : std_logic;
    data : std_logic
);
end entity;

architecture rtl of i2s_generator_agent is
begin

    process
    begin
        word_select <= not word_select;
        for i in 1 to bit_depth loop
            wait for (1/ (bit_rate*2*bit_depth)) * sec;

            end loop;
        end process;
        
end architecture;
