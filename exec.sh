set -e

ghdl -a design.vhd testbench.vhd
ghdl -e test_bench
ghdl -r test_bench --wave=wave.ghw

gtkwave wave.ghw