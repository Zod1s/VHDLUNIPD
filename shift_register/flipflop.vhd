-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY flipflop IS
    PORT (
        D : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        Q, Qn : OUT STD_LOGIC
    );
END flipflop;

ARCHITECTURE FF OF flipflop IS
    SIGNAL Q1, clkM, clkS : STD_LOGIC;
BEGIN
    master : ENTITY work.DLatch
        PORT MAP(
            D => D,
            En => clkM,
            Q => Q1,
            Qn => OPEN
        );

    slave : ENTITY work.DLatch
        PORT MAP(
            D => Q1,
            En => clkS,
            Q => Q,
            Qn => Qn
        );

    clkM <= NOT(clk);
    clkS <= NOT(clkM);
END FF;

-- LIBRARY IEEE;
-- USE IEEE.std_logic_1164.ALL;

-- ENTITY flipflop IS
--     PORT (
--         D, clk : IN STD_LOGIC;
--         Q, QN : OUT STD_LOGIC
--     );
-- END flipflop;

-- ARCHITECTURE DFF_arch OF flipflop IS
-- BEGIN
--     DFF_proc : PROCESS (clk)
--     BEGIN
--         IF rising_edge(clk) THEN
--             Q <= D;
--             QN <= NOT(D);
--         END IF;
--     END PROCESS;
-- END DFF_arch;