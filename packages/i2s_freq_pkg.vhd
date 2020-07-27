library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package i2s_freq_pkg is
    
    function calc_half_period(
        bit_rate : real; 
        bit_depth : real
    ) return time;
    function calc_half_period(
        bit_rate : integer; 
        bit_depth : integer
    ) return time;
            
end package;

package body i2s_freq_pkg is
    function calc_half_period(
        bit_rate : real; 
        bit_depth : real
    ) return time is
        variable ret_val : time; 
        variable tmp : integer;
    begin
        tmp := integer((1.0/(2.0*2.0*bit_rate*bit_depth)))*(10**15); --get it into picoseconds size, and integer-ise it
        return 1 fs * tmp;
    end function;
    function calc_half_period(
        bit_rate : integer; 
        bit_depth : integer
    ) return time is

        begin
            return calc_half_period(real(bit_rate),real(bit_depth));
            end function;
end package body;