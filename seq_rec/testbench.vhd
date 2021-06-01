-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS
    SIGNAL x : STD_LOGIC;
    SIGNAL z : STD_LOGIC;
BEGIN
    seq_rec : ENTITY work.seq_rec(rtl) PORT MAP (
        x => x,
        z => z
        );
    exec : PROCESS
    BEGIN
        x <= '0' AFTER 0 ns,
            '1' AFTER 10 ns,
            '1' AFTER 20 ns,
            '0' AFTER 30 ns,
            '1' AFTER 40 ns,
            '1' AFTER 50 ns,
            '0' AFTER 60 ns,
            '1' AFTER 70 ns,
            '0' AFTER 80 ns;
        WAIT;
    END PROCESS;
END tb_arch;