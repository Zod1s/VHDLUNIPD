-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
        Cin, A, B : IN STD_LOGIC;
        S, Co : OUT STD_LOGIC
    );
END full_adder;

ARCHITECTURE adder OF full_adder IS

    SIGNAL Pint, Gint : STD_LOGIC;
    SIGNAL PCi : STD_LOGIC;

BEGIN
    ha1 : ENTITY work.half_adder
        PORT MAP(
            A => A,
            B => B,
            P => Pint,
            G => Gint
        );

    ha2 : ENTITY work.half_adder
        PORT MAP(
            A => Pint,
            B => Cin,
            P => S,
            G => PCi
        );

    Co <= Gint OR PCi;
END adder;