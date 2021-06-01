-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dff IS
    PORT (
        d, clk, res : IN STD_LOGIC;
        q : OUT STD_LOGIC
    );
END dff;

ARCHITECTURE bev OF dff IS
BEGIN
    proc : PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            q <= '0';
        ELSIF rising_edge(clk) THEN
            q <= d;
        END IF;
    END PROCESS;
END bev;