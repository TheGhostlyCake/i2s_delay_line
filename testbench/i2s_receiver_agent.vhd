library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;
use vunit_lib.logger_pkg.all; 

library i2s_freq_pkg;
use i2s_freq_pkg.i2s_freq_pkg.all;

entity i2s_receiver_agent is 
generic (
    bit_rate : integer := 441000;
    bit_depth : integer := 16
);
port (
    word_select : in std_logic;
    clk : in std_logic;
    data : in std_logic
);
end entity;

architecture rtl of i2s_receiver_agent is
 
    
begin


end architecture;
