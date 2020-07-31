library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;
use vunit_lib.logger_pkg.all; 

library lib;
library tb_lib;

library i2s_freq_pkg;
use i2s_freq_pkg.i2s_freq_pkg.all;


entity tb_i2s_delay_line is
  generic (runner_cfg : string);
end entity;



architecture tb of tb_i2s_delay_line is
signal clk : std_logic := '0';
signal reset : std_logic := '0'; 
signal i2s_clk : std_logic; 
signal i2s_word_select : std_logic; 
signal i2s_data : std_logic; 
constant logger : logger_t := get_logger("top_logger");
begin
--
i2s_agent : entity tb_lib.i2s_generator_agent
port map (
  clk => i2s_clk,
  word_select => i2s_word_select,
  data => i2s_data 
);
--
DUT : entity lib.i2s_delay_line
port map(
  clk => clk,
  reset => reset
);  
--
process 
begin
    wait for 10 ns;
    clk <= not clk;
end process;
--
process
begin
    for i in 1 to 2 loop
        wait until rising_edge(clk);
    end loop;
    reset <= '1';
    wait;
end process;
--

  main : process
  procedure function_test is --lets test any functions we make here
    variable tmp_time : time;
    begin
      tmp_time := calc_half_period(44100,16);
      log(logger,time'image(tmp_time));
      --check_equal(tmp_time,)

      end procedure;
  begin
    test_runner_setup(runner, runner_cfg);
    show_all(display_handler);
    while test_suite loop

      if run("function_test") then
        function_test;
        
      elsif run("test_fail") then
        wait for 10 ms;

      end if;
    end loop;

    test_runner_cleanup(runner);
  end process;
  test_runner_watchdog(runner,11 ms);
end architecture;