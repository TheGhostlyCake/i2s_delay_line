library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

library lib;

entity tb_i2s_delay_line is
  generic (runner_cfg : string);
end entity;



architecture tb of tb_i2s_delay_line is
signal clk : std_logic := '0';
signal reset : std_logic := '0'; 
begin
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
  begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop

      if run("test_pass") then
        report "This will pass";

      elsif run("test_fail") then
        assert false report "It fails";

      end if;
    end loop;

    test_runner_cleanup(runner);
  end process;
end architecture;