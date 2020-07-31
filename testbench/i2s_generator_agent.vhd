library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;
use vunit_lib.logger_pkg.all; 

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
     procedure send_words(constant arg : std_logic_vector)is
        begin
            check_equal(arg'length, bit_depth,"incorrect vector size");

            for i in 0 to bit_depth -1 loop
                wait for calc_half_period(bit_rate,bit_depth);
                data <= arg(i);
                clk <= not clk;
                wait for calc_half_period(bit_rate,bit_depth);
                clk <= not clk;
                end loop;
                word_select <= not word_select;
            end procedure;
    begin
        word_select <= '0'; 
        clk <= '0'; 
        data <= '0';
        while true loop
            send_words(16X"0123");
            end loop;
        end process; 
        
end architecture;
