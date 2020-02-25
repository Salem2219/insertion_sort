library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp4 is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end comp4;

architecture rtl of comp4 is
    begin
        y <= '1' when a =b else '0';
    end rtl;