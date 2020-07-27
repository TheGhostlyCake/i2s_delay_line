from vunit import VUnit


vu = VUnit.from_argv()


lib = vu.add_library("lib")
lib.add_source_files("src/*.vhd")

tb_lib=vu.add_library("tb_lib")
tb_lib.add_source_files("testbench/*.vhd")

i2s_freq_pkg = vu.add_library("i2s_freq_pkg")
i2s_freq_pkg.add_source_file("packages/i2s_freq_pkg.vhd")

vu.set_compile_option("ghdl.a_flags", ["--std=08"])

vu.main()