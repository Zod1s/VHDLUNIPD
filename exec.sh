set -e

if [[ $1 ]]
then
    ghdl -a $1 design.vhd testbench.vhd
else
    ghdl -a design.vhd testbench.vhd
fi
ghdl -e test_bench
ghdl -r test_bench --wave=wave.ghw

gtkwave wave.ghw