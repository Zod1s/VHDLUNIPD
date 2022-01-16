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
    SIGNAL Pout, Gout : STD_LOGIC;
    SIGNAL PCi : STD_LOGIC;

BEGIN
    ha1 : ENTITY work.half_adder
        PORT MAP(
            A => A,
            B => B,
            P => Pout,
            G => Gout
        );

    ha2 : ENTITY work.half_adder
        PORT MAP(
            A => Pout,
            B => Cin,
            P => S,
            G => PCi
        );

    Co <= Gout OR PCi;
END adder;
