-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY DLatch IS
    PORT (
        D, En : IN STD_LOGIC;
        Q, Qn : OUT STD_LOGIC
    );
END DLatch;

ARCHITECTURE archD OF DLatch IS
BEGIN
    procD : PROCESS (D, En)
    BEGIN
        IF (En = '1') THEN
            Q <= D;
            Qn <= NOT(D);
        END IF;
    END PROCESS;
END archD;