-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL a : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL b : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL f : STD_LOGIC;

BEGIN
    mux : ENTITY work.comparator(comp_arch) PORT MAP(
        a1 => a(1),
        a0 => a(0),
        b1 => b(1),
        b0 => b(0),
        f => f
        );

    tb_proc : PROCESS

    BEGIN
        a <= "00";
        b <= "10";
        WAIT FOR 1 ns;
        ASSERT (f = '0') REPORT "ERROR ON 00 10";

        a <= "00";
        b <= "01";
        WAIT FOR 1 ns;
        ASSERT (f = '0') REPORT "ERROR ON 00 01";

        a <= "01";
        b <= "00";
        WAIT FOR 1 ns;
        ASSERT (f = '1') REPORT "ERROR ON 01 00";

        a <= "01";
        b <= "11";
        WAIT FOR 1 ns;
        ASSERT (f = '0') REPORT "ERROR ON 01 11";

        a <= "10";
        b <= "01";
        WAIT FOR 1 ns;
        ASSERT (f = '1') REPORT "ERROR ON 10";

        a <= "10";
        b <= "11";
        WAIT FOR 1 ns;
        ASSERT (f = '0') REPORT "ERROR ON 10 1X";

        a <= "11";
        b <= "01";
        WAIT FOR 1 ns;
        ASSERT (f = '1') REPORT "ERROR ON 11 01";

        a <= "11";
        b <= "11";
        WAIT FOR 1 ns;
        ASSERT (f = '0') REPORT "ERROR ON 11 11";

        WAIT;

    END PROCESS;
END tb_arch; -- test_bench