-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dff IS
    PORT (
        clk, d, res : IN STD_LOGIC;
        q : OUT STD_LOGIC
    );
END dff;

ARCHITECTURE bev OF dff IS
BEGIN
    dff_proc : PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            q <= '0';
        ELSIF rising_edge(clk) THEN
            q <= d;
        END IF;
    END PROCESS;
END bev;