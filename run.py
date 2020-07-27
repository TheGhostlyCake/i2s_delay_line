from vunit import VUnit


vu = VUnit.from_argv()


lib = vu.add_library("lib")
lib.add_source_files("src/*.vhd")

tb_lib=vu.add_library("tb_lib")
tb_lib.add_source_files("tb_lib/*.vhd")

vu.main()