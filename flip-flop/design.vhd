LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY DFF IS
  PORT (
    D, clk, RES : IN STD_LOGIC;
    EN : IN STD_LOGIC;
    Q : OUT STD_LOGIC
    );
END DFF;

ARCHITECTURE DFF_arch OF DFF IS
BEGIN
  DFF_proc : PROCESS (clk, RES)
  BEGIN
    IF (RES = '1') THEN
      Q <= '0';-- ELSIF (clk'event AND clk = '1') THEN
    ELSIF rising_edge(clk) THEN
      IF (EN = '1') THEN
        Q <= D;
      END IF;
    END IF;
  END PROCESS;
END DFF_arch;
