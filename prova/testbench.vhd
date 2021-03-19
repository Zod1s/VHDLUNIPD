-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity test_bench is -- creo un entity senza ingressi né uscite

end test_bench;

architecture tb_arch of test_bench is

signal atb, btb, ctb : std_logic;

begin
    lc : entity work.circuit(circuit_arch) port map(
        A => atb,
        B => btb,
        C => ctb,
        Y => open
    );

    -- atb <= '0' after 0 ns, '1' after 1 ns;
    -- btb <= '0' after 0 ns, '1' after 7 ns;
    -- ctb <= '0' after 0 ns, '1' after 5 ns;

    tb_proc : process
    
    begin
        atb <= '0';
        btb <= '0';
        ctb <= '0';

        wait for 1 ns;
        atb <= '1';

        wait for 4 ns;
        ctb <= '1';

        wait for 2 ns;
        btb <= '1';

        wait; -- sospende definitivamente l'esecuzione del processo
    end process;

end tb_arch;