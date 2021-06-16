-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dff IS
    PORT (
        d, res, clk : IN STD_LOGIC;
        q, qn : OUT STD_LOGIC
    );
END dff;

ARCHITECTURE bev OF dff IS
BEGIN
    proc : PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            q <= '0';
            qn <= '1';
        ELSIF rising_edge(clk) THEN
            q <= d;
            qn <= NOT d;
        END IF;
    END PROCESS;
END bev;