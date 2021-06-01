-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY seq_rec IS
    PORT (
        x : IN STD_LOGIC;
        z : OUT STD_LOGIC
    );
END seq_rec;

ARCHITECTURE rtl OF seq_rec IS
    SIGNAL clk : STD_LOGIC;
    SIGNAL res : STD_LOGIC;
    SIGNAL d1 : STD_LOGIC;
    SIGNAL q1 : STD_LOGIC;
    SIGNAL d2 : STD_LOGIC;
    SIGNAL q2 : STD_LOGIC;
BEGIN
    ff1 : ENTITY work.dff(bev) PORT MAP (
        res => res,
        clk => clk,
        d => x,
        q => q1
        );

    ff2 : ENTITY work.dff(bev) PORT MAP (
        res => res,
        clk => clk,
        d => d2,
        q => q2
        );

    clk_proc : PROCESS
    BEGIN
        FOR i IN 1 TO 10 LOOP
            clk <= '0';
            WAIT FOR 5 ns;
            clk <= '1';
            WAIT FOR 5 ns;
        END LOOP;
        WAIT;
    END PROCESS;

    res <= '1' AFTER 0 ns, '0' AFTER 1 ns;
    d2 <= (q1 AND q2) OR (q1 AND x);
    z <= q2 AND (NOT q1) AND x;
END rtl;