-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL Dgen, RESgen, Qout : STD_LOGIC;
    SIGNAL clk : STD_LOGIC;

BEGIN
    mux : ENTITY work.DFF(DFF_arch) PORT MAP(
        D => Dgen,
        clk => clk,
        RES => RESgen,
        EN => '1',
        Q => Qout
        );

    -- clk <= '0' AFTER 0 ns, -- un modo per generare un segnale
    --     '1' AFTER 10 ns, -- di clock
    --     '0' AFTER 20 ns,
    --     '1' AFTER 30 ns,
    --     '0' AFTER 40 ns,
    --     '1' AFTER 50 ns,
    --     '0' AFTER 60 ns,
    --     '1' AFTER 70 ns,
    --     '0' AFTER 80 ns;

    -- clk_proc : PROCESS -- senza sens list, quindi serve un wait finale
    -- BEGIN
    --     IF (now < 70 ns) THEN -- now dà il tempo attuale di esecuzione
    --         clk <= '0';
    --         WAIT FOR 10 ns;
    --         clk <= '1';
    --         WAIT FOR 10 ns;
    --     ELSE -- la simulazione dura 70 ns
    --         WAIT;
    --     END IF;
    -- END PROCESS;

    clk_proc : PROCESS
    BEGIN
        FOR i IN 1 TO 4 LOOP
            clk <= '0';
            WAIT FOR 10 ns;
            clk <= '1';
            WAIT FOR 10 ns;
        END LOOP;

        WAIT;
    END PROCESS;

    RESgen <= '1' AFTER 0 ns,
        '0' AFTER 0.5 ns,
        '1' AFTER 55 ns;

    Dgen <= '0' AFTER 0 ns,
        '1' AFTER 5 ns,
        '0' AFTER 15 ns,
        '1' AFTER 21 ns,
        '0' AFTER 24 ns,
        '1' AFTER 35 ns;
END tb_arch; -- test_bench