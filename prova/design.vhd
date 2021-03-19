-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity circuit is
    port (
        a, B, C : in std_logic;
        Y : out std_logic
    );
end circuit;

architecture circuit_arch of circuit is -- descrizione RTL
-- parte dichiarativa
signal X : std_logic;

begin
    -- corpo architettura
    X <= A or B;
    Y <= X and C;

end circuit_arch;