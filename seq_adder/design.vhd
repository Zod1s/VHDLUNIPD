-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY summer IS
    PORT (
        a, b : IN STD_LOGIC;
        s : OUT STD_LOGIC
    );
END summer;

-- ARCHITECTURE rtl OF summer IS
--     COMPONENT dff IS
--         PORT (
--             clk, d : IN STD_LOGIC;
--             q : OUT STD_LOGIC
--         );
--     END COMPONENT;

--     SIGNAL d : STD_LOGIC;
--     SIGNAL clk : STD_LOGIC;
--     SIGNAL res : STD_LOGIC;
--     SIGNAL q : STD_LOGIC;
--     SIGNAL a1, a2, a3, a4, a5, a6, a7 : STD_LOGIC;

-- BEGIN
--     ff : ENTITY work.dff(bev) PORT MAP (
--         clk => clk,
--         res => res,
--         d => d,
--         q => q
--         );

--     clk_proc : PROCESS
--     BEGIN
--         FOR i IN 1 TO 4 LOOP
--             clk <= '0';
--             WAIT FOR 5 ns;
--             clk <= '1';
--             WAIT FOR 5 ns;
--         END LOOP;
--         WAIT;
--     END PROCESS;

--     res <= '1' AFTER 0 ns,
--         '0' AFTER 5 ns;

--     a1 <= a AND b AND q;
--     a2 <= (NOT b) AND (NOT a) AND q;
--     a3 <= (NOT a) AND b AND (NOT q);
--     a4 <= a AND (NOT b) AND (NOT q);
--     a5 <= a AND b;
--     a6 <= a AND q;
--     a7 <= b AND q;

--     s <= a1 OR a2 OR a3 OR a4;
--     d <= a5 OR a6 OR a7;

-- END rtl;

ARCHITECTURE bev OF summer IS
    TYPE state IS (S0, S1);
    SIGNAL nxs : state;
    SIGNAL St : state := S0;
    SIGNAL clk : STD_LOGIC;
BEGIN

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

    proc : PROCESS (a, b, St)
    BEGIN
        CASE St IS
            WHEN S0 =>
                IF (a = '0') THEN
                    IF (b = '0') THEN
                        s <= '0';
                    ELSIF (b = '1') THEN
                        s <= '1';
                    END IF;
                ELSIF (a = '1') THEN
                    IF (b = '0') THEN
                        s <= '1';
                    ELSIF (b = '1') THEN
                        s <= '0';
                        nxs <= S1;
                    END IF;
                END IF;
            WHEN S1 =>
                IF (a = '0') THEN
                    IF (b = '0') THEN
                        s <= '1';
                        nxs <= S0;
                    ELSIF (b = '1') THEN
                        s <= '0';
                    END IF;
                ELSIF (a = '1') THEN
                    IF (b = '0') THEN
                        s <= '0';
                    ELSIF (b = '1') THEN
                        s <= '1';
                    END IF;
                END IF;
        END CASE;
    END PROCESS;

    agg : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            St <= nxs;
        END IF;
    END PROCESS;
END bev;