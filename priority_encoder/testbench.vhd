-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY test_bench IS -- creo un entity senza ingressi né uscite
END test_bench;

ARCHITECTURE tb_arch OF test_bench IS

    SIGNAL dtb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL A1, A2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL V1, V2 : STD_LOGIC;

BEGIN
    enc1 : ENTITY work.priority_encoder(enc_dataflow1)
        PORT MAP(
            D => dtb,
            A => A1,
            V => V1
        );

    enc2 : ENTITY work.priority_encoder(enc_bev1)
        PORT MAP(
            D => dtb,
            A => A2,
            V => V2
        );

    tb_proc : PROCESS

    BEGIN
        dtb <= "0000";
        WAIT FOR 1 ns;

        dtb <= "0001";
        WAIT FOR 1 ns;

        dtb <= "0010";
        WAIT FOR 1 ns;

        dtb <= "0011";
        WAIT FOR 1 ns;

        dtb <= "0101";
        WAIT FOR 1 ns;

        dtb <= "1101";
        WAIT FOR 1 ns;

        WAIT;
    END PROCESS;
END tb_arch;