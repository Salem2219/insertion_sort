library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder4 is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end adder4;

architecture rtl of adder4 is
    signal y_uns : unsigned(3 downto 0);
    begin
        y_uns <= unsigned(a) + unsigned(b);
        y <= std_logic_vector (y_uns);
    end rtl;