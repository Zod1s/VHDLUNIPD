-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL s : STD_LOGIC;
    SIGNAL a, b : STD_LOGIC;

BEGIN
    summer : ENTITY work.summer(rtl) PORT MAP(
        a => a,
        b => b,
        s => s
        );

    exec : PROCESS
    BEGIN
        a <= '1' AFTER 0 ns,
            '0' AFTER 5 ns,
            '1' AFTER 10 ns,
            '0' AFTER 20 ns;

        b <= '0' AFTER 0 ns,
            '1' AFTER 5 ns,
            '1' AFTER 10 ns,
            '0' AFTER 20 ns;
        WAIT;
    END PROCESS;
END tb_arch;