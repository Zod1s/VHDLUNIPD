-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY multiplexer IS
    PORT (
        I : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Y : OUT STD_LOGIC
    );
END multiplexer;

ARCHITECTURE arch_mul OF multiplexer IS
BEGIN
    Y <= I(0) WHEN S = "00" ELSE
        I(1) WHEN S = "01" ELSE
        I(2) WHEN S = "10" ELSE
        I(3) WHEN S = "11" ELSE
        'X';
END arch_mul;