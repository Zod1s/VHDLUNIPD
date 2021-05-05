-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sh_reg IS
    PORT (
        clk, res : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(0 TO 3);
        SLi, SRi : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(0 TO 1);
        Q : OUT STD_LOGIC_VECTOR(0 TO 3)
    );
END sh_reg;

ARCHITECTURE arch_shReg OF sh_reg IS
    SIGNAL Y, Q1 : STD_LOGIC_VECTOR (0 TO 3);
BEGIN
    mul0 : ENTITY work.multiplexer
        PORT MAP(
            I(0) => Q1(0),
            I(1) => Q1(1),
            I(2) => SLi,
            I(3) => D(0),
            S => S,
            Y => Y(0)
        );

    mul1 : ENTITY work.multiplexer
        PORT MAP(
            I(0) => Q1(1),
            I(1) => Q1(2),
            I(2) => Q1(0),
            I(3) => D(1),
            S => S,
            Y => Y(1)
        );

    mul2 : ENTITY work.multiplexer
        PORT MAP(
            I(0) => Q1(2),
            I(1) => Q1(3),
            I(2) => Q1(1),
            I(3) => D(2),
            S => S,
            Y => Y(2)
        );

    mul3 : ENTITY work.multiplexer
        PORT MAP(
            I(0) => Q1(3),
            I(1) => SRi,
            I(2) => Q1(2),
            I(3) => D(3),
            S => S,
            Y => Y(3)
        );

    FF0 : ENTITY work.flipflop
        PORT MAP(
            D => Y(0),
            clk => clk,
            Q => Q1(0),
            Qn => OPEN
        );

    FF1 : ENTITY work.flipflop
        PORT MAP(
            D => Y(1),
            clk => clk,
            Q => Q1(1),
            Qn => OPEN
        );

    FF2 : ENTITY work.flipflop
        PORT MAP(
            D => Y(2),
            clk => clk,
            Q => Q1(2),
            Qn => OPEN
        );

    FF3 : ENTITY work.flipflop
        PORT MAP(
            D => Y(3),
            clk => clk,
            Q => Q1(3),
            Qn => OPEN
        );

    procRes : PROCESS (Q1, res)
    BEGIN
        IF (res = '1') THEN
            Y(0) <= '0';
            Y(1) <= '0';
            Y(2) <= '0';
            Y(3) <= '0';
        END IF;
        Q <= Q1;
    END PROCESS;
END arch_shReg;