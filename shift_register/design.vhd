-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY usr IS
    PORT (
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        SRi, SLi : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        res : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END usr;

ARCHITECTURE rtl OF usr IS
    SIGNAL Qin : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL Qo1, Qo2 : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    mux0 : ENTITY work.mux(bev) PORT MAP (
        S => S,
        I(0) => Qo1(0),
        I(1) => Qo1(1),
        I(2) => SLi,
        I(3) => D(0),
        Y => Qin(0)
        );

    mux1 : ENTITY work.mux(bev) PORT MAP (
        S => S,
        I(0) => Qo1(1),
        I(1) => Qo1(2),
        I(2) => Qo1(0),
        I(3) => D(1),
        Y => Qin(1)
        );

    mux2 : ENTITY work.mux(bev) PORT MAP (
        S => S,
        I(0) => Qo1(2),
        I(1) => Qo1(3),
        I(2) => Qo1(1),
        I(3) => D(2),
        Y => Qin(2)
        );

    mux3 : ENTITY work.mux(bev) PORT MAP (
        S => S,
        I(0) => Qo1(3),
        I(1) => SRi,
        I(2) => Qo1(2),
        I(3) => D(3),
        Y => Qin(3)
        );

    FF0 : ENTITY work.dff(bev) PORT MAP (
        d => Qin(0),
        res => res,
        clk => clk,
        q => Qo2(0),
        qn => OPEN
        );

    FF1 : ENTITY work.dff(bev) PORT MAP (
        d => Qin(1),
        res => res,
        clk => clk,
        q => Qo2(1),
        qn => OPEN
        );

    FF2 : ENTITY work.dff(bev) PORT MAP (
        d => Qin(2),
        res => res,
        clk => clk,
        q => Qo2(2),
        qn => OPEN
        );

    FF3 : ENTITY work.dff(bev) PORT MAP (
        d => Qin(3),
        res => res,
        clk => clk,
        q => Qo2(3),
        qn => OPEN
        );

    proc : PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            Q <= "0000";
        ELSIF rising_edge(clk) THEN
            Q <= Qo2;
            Qo1 <= Qo2;
        END IF;
    END PROCESS;
END rtl;