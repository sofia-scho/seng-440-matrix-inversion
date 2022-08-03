library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_signed.ALL;

--general instantiation of ports for simulation
entity fast_multiplier IS
    port (
        a,b: in std_logic_vector (11 downto 0);
        output: out std_logic_vector (23 downto 0)
    );
end fast_multiplier;

architecture behavioural of fast_multiplier is

    --internal signals
    signal a_temp, b_temp: signed (11 downto 0);
    signal out_temp: signed (23 downto 0);

    begin
        a_temp <= signed (a);
        b_temp <= signed (b);

        --simple multiplication but synthesized to a combinatorial circuit
        out_temp <= a_temp * b_temp;
        
        output <= std_logic_vector(out_temp);

end behavioural;
