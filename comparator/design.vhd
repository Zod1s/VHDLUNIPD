-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY comparator IS
    PORT (
        a1, a0, b1, b0 : IN STD_LOGIC;
        f : OUT STD_LOGIC
    );
END comparator;

ARCHITECTURE comp_arch OF comparator IS

    SIGNAL x1, x2, x3 : STD_LOGIC;

BEGIN
    x1 <= a1 AND (NOT b1);
    x2 <= a0 AND ((NOT b1) AND (NOT b0));
    x3 <= a1 AND (a0 AND (NOT b0));

    f <= x1 OR x2 OR x3;
END comp_arch; -- mux_arch