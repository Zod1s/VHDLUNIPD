-- Code your design here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY priority_encoder IS
    PORT (
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        A : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        V : OUT STD_LOGIC
    );
END priority_encoder;

ARCHITECTURE enc_dataflow1 OF priority_encoder IS

BEGIN
    A(1) <= D(3) OR D(2);
    A(0) <= D(3) OR (D(1) AND (NOT D(2)));
    V <= D(0) OR D(1) OR D(2) OR D(3);

END enc_dataflow1; -- enc_dataflow1

ARCHITECTURE enc_bev1 OF priority_encoder IS
BEGIN
    proc : PROCESS (D)

    BEGIN
        IF (D(3) = '1') THEN
            A <= "11";
            V <= '1';

        ELSIF (D(2) = '1') THEN
            A <= "10";
            V <= '1';

        ELSIF (D(1) = '1') THEN
            A <= "01";
            V <= '1';

        ELSIF (D(0) = '1') THEN
            A <= "00";
            V <= '1';

        ELSE
            A <= "00";
            V <= '0';
        END IF;

    END PROCESS;

END enc_bev1; -- enc_bev1