library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library i2s_freq_pkg;
use i2s_freq_pkg.i2s_freq_pkg.all;
entity i2s_generator_agent is 
generic (
    bit_rate : integer := 441000;
    bit_depth : integer := 16
);
port (
    word_select : out std_logic;
    clk : out std_logic;
    data : out std_logic
);
end entity;

architecture rtl of i2s_generator_agent is
 
    
begin

    process
    begin
        word_select <= not word_select;
        for i in 1 to bit_depth loop
            wait for calc_half_period(bit_rate,bit_depth);
            clk <= not clk;
            end loop;
        end process;
        
end architecture;
