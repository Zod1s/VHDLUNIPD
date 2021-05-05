-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS
    SIGNAL tclk, tres, tSLi, tSRi : STD_LOGIC;
    SIGNAL tS : STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL tD, tQ : STD_LOGIC_VECTOR(0 TO 3);
BEGIN
    shRegtb : ENTITY work.sh_reg
        PORT MAP(
            clk => tclk,
            res => tres,
            D => tD,
            SLi => tSLi,
            SRi => tSRi,
            S => tS,
            Q => tQ);

    clkproc : PROCESS
    BEGIN
        FOR i IN 1 TO 15 LOOP
            tclk <= '0';
            WAIT FOR 5 ns;
            tclk <= '1';
            WAIT FOR 5 ns;
        END LOOP;
        WAIT;
    END PROCESS;

    funzionamento : PROCESS
    BEGIN
        tres <= '1';
        WAIT FOR 8 ns;
        tres <= '0';
        WAIT FOR 5 ns;
        tD <= "1010";
        WAIT FOR 5 ns;
        tS <= "11";
        WAIT FOR 5 ns;
        tSLi <= '0';
        WAIT FOR 5 ns;
        tS <= "10";
        WAIT;
    END PROCESS;
END tb_arch;