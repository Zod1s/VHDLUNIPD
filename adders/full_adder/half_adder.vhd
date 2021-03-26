LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
        A, B : IN STD_LOGIC;
        P, G : OUT STD_LOGIC
    );
END half_adder;

ARCHITECTURE hlf OF half_adder IS

BEGIN
    P <= A XOR B;
    G <= A AND B;
END hlf;