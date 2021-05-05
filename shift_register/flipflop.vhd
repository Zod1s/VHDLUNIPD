-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY flipFlop IS
    PORT (
        D : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        Q, Qn : OUT STD_LOGIC
    );
END flipFlop;

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

    procClk : PROCESS (clk)
    BEGIN
        clkM <= NOT(clk);
        clkS <= NOT(clkM);
    END PROCESS;
END FF;