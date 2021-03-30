-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL Atb, Btb, Citb, Stb, Cotb : STD_LOGIC;

BEGIN
    adder : ENTITY work.full_adder(adder) PORT MAP(
        A => Atb,
        B => Btb,
        Cin => Citb,
        S => Stb,
        Co => Cotb
        );

    tb_proc : PROCESS

    BEGIN
        Atb <= '0';
        Btb <= '0';
        Citb <= '0';
        WAIT FOR 1 ns;
        ASSERT (Stb = '0' AND Cotb = '0') REPORT "error on 000";

        Atb <= '0';
        Btb <= '0';
        Citb <= '1';
        WAIT FOR 1 ns;
        ASSERT (Stb = '1' AND Cotb = '0') REPORT "error on 001";

        Atb <= '0';
        Btb <= '1';
        Citb <= '0';
        WAIT FOR 1 ns;
        ASSERT (Stb = '1' AND Cotb = '0') REPORT "error on 010";

        Atb <= '0';
        Btb <= '1';
        Citb <= '1';
        WAIT FOR 1 ns;
        ASSERT (Stb = '0' AND Cotb = '1') REPORT "error on 011";

        Atb <= '1';
        Btb <= '0';
        Citb <= '0';
        WAIT FOR 1 ns;
        ASSERT (Stb = '1' AND Cotb = '0') REPORT "error on 100";

        Atb <= '1';
        Btb <= '0';
        Citb <= '1';
        WAIT FOR 1 ns;
        ASSERT (Stb = '0' AND Cotb = '1') REPORT "error on 101";

        Atb <= '1';
        Btb <= '1';
        Citb <= '0';
        WAIT FOR 1 ns;
        ASSERT (Stb = '0' AND Cotb = '1') REPORT "error on 110";

        Atb <= '1';
        Btb <= '1';
        Citb <= '1';
        WAIT FOR 1 ns;
        ASSERT (Stb = '1' AND Cotb = '1') REPORT "error on 111";

        WAIT;
    END PROCESS;
END tb_arch; -- test_bench