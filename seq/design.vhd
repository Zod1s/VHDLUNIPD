-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY summer IS
    PORT (
        a, b : IN STD_LOGIC;
        s : OUT STD_LOGIC
    );
END summer;

ARCHITECTURE rtl OF summer IS
    SIGNAL d : STD_LOGIC;
    SIGNAL clk : STD_LOGIC;
    SIGNAL res : STD_LOGIC;
    SIGNAL q : STD_LOGIC;
    SIGNAL a1, a2, a3, a4, a5, a6, a7 : STD_LOGIC;

BEGIN
    ff : ENTITY work.dff(bev) PORT MAP (
        clk => clk,
        res => res,
        d => d,
        q => q
        );

    clk_proc : PROCESS
    BEGIN
        FOR i IN 1 TO 4 LOOP
            clk <= '0';
            WAIT FOR 5 ns;
            clk <= '1';
            WAIT FOR 5 ns;
        END LOOP;
        WAIT;
    END PROCESS;

    res <= '1' AFTER 0 ns,
        '0' AFTER 5 ns;

    a1 <= a AND b AND q;
    a2 <= (NOT b) AND (NOT a) AND q;
    a3 <= (NOT a) AND b AND (NOT q);
    a4 <= a AND (NOT b) AND (NOT q);
    a5 <= a AND b;
    a6 <= a AND q;
    a7 <= b AND q;

    s <= a1 OR a2 OR a3 OR a4;
    d <= a5 OR a6 OR a7;

END rtl;
