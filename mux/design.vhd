-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux_4_1 IS
    PORT (
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        I : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Y : OUT STD_LOGIC
    );
END mux_4_1;

ARCHITECTURE mux_arch_bev1 OF mux_4_1 IS -- comportamentale perché dico come si comporta, non come funziona

BEGIN
    -- driver sensibile a S e I
    Y <= I(0) WHEN S = "00" ELSE
        I(1) WHEN S = "01" ELSE
        I(2) WHEN S = "10" ELSE
        I(3) WHEN S = "11" ELSE
        'X';

END mux_arch_bev1; -- mux_arch

ARCHITECTURE mux_arch_bev2 OF mux_4_1 IS -- comportamentale perché dico come si comporta, non come funziona

BEGIN
    -- driver sensibile a S e I
    WITH S SELECT
        Y <= I(0) WHEN "00",
        I(1) WHEN "01",
        I(2) WHEN "10",
        I(3) WHEN "11",
        'X' WHEN OTHERS;

END mux_arch_bev2; -- mux_arch

ARCHITECTURE mux_arch_bev3 OF mux_4_1 IS -- comportamentale perché dico come si comporta, non come funziona

BEGIN
    mux_proc : PROCESS (S, I)

    BEGIN
        IF (S = "00") THEN
            Y <= I(0);
        ELSIF (S = "01") THEN
            Y <= I(1);
        ELSIF (S = "10") THEN
            Y <= I(2);
        ELSIF (S = "11") THEN
            Y <= I(3);
        ELSE
            Y <= 'X';
        END IF;
    END PROCESS;

END mux_arch_bev3; -- mux_arch

ARCHITECTURE mux_arch_bev4 OF mux_4_1 IS -- comportamentale perché dico come si comporta, non come funziona

BEGIN
    mux_proc : PROCESS (S, I)

    BEGIN
        CASE S IS
            WHEN "00" =>
                Y <= I(0);
            WHEN "01" =>
                Y <= I(1);
            WHEN "10" =>
                Y <= I(2);
            WHEN "11" =>
                Y <= I(3);
            WHEN OTHERS =>
                Y <= 'X';
        END CASE;
    END PROCESS;

END mux_arch_bev4; -- mux_arch

ARCHITECTURE mux_arch_dataflow OF mux_4_1 IS

    SIGNAL m0, m1, m2, m3 : STD_LOGIC;

BEGIN
    m0 <= (NOT S(1)) AND (NOT S(0)); -- minterm associati all'ingresso di selezione
    m1 <= (NOT S(1)) AND S(0); -- è un decoder 2-to-4
    m2 <= S(1) AND (NOT S(0));
    m3 <= S(1) AND S(0);

    Y <= (I(0) AND m0) OR
        (I(1) AND m1) OR
        (I(2) AND m2) OR
        (I(3) AND m3);

END mux_arch_dataflow; -- mux_arch_dataflow