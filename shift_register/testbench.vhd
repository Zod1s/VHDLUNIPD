-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS
    SIGNAL clk, SRi, SLi : STD_LOGIC;
    SIGNAL Q, D : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL S : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL res : STD_LOGIC;

BEGIN
    shift_reg : ENTITY work.usr(rtl) PORT MAP(
        D => D,
        S => S,
        SRi => SRi,
        SLi => SLi,
        clk => clk,
        res => res,
        Q => Q
        );

    clk_proc : PROCESS
    BEGIN
        FOR i IN 1 TO 4 LOOP
            clk <= '1';
            WAIT FOR 5 ns;
            clk <= '0';
            WAIT FOR 5 ns;
        END LOOP;
        WAIT;
    END PROCESS;

    D <= "0110" AFTER 0 ns, "0000" AFTER 10 ns;
    S <= "11" AFTER 0 ns, "01" AFTER 10 ns;
    SRi <= '0';
    SLi <= '0';
    res <= '1' AFTER 0 ns, '0' AFTER 1 ns;

END tb_arch;