-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL i : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL y : STD_LOGIC;

BEGIN
    mux : ENTITY work.mux_4_1(mux_arch_dataflow) PORT MAP(
        S => sel,
        I => i,
        Y => Y
        );

    tb_proc : PROCESS

    BEGIN
        I <= "1001";

        sel <= "00";
        WAIT FOR 1 ns;
        ASSERT (Y = i(0)) REPORT "Error on 00";

        sel <= "01";
        WAIT FOR 1 ns;
        ASSERT (Y = i(1)) REPORT "Error on 00";

        sel <= "10";
        WAIT FOR 1 ns;
        ASSERT (Y = i(2)) REPORT "Error on 00";

        sel <= "11";
        WAIT FOR 1 ns;
        ASSERT (Y = i(3)) REPORT "Error on 00";

        WAIT;
    END PROCESS;
END tb_arch; -- test_bench