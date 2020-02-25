library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder5 is
    port (a, b : in std_logic_vector(4 downto 0);
    y : out std_logic_vector(4 downto 0));
end adder5;

architecture rtl of adder5 is
    signal y_uns : unsigned(4 downto 0);
    begin
        y_uns <= unsigned(a) + unsigned(b);
        y <= std_logic_vector (y_uns);
    end rtl;