library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux2_5 is
    port (s: in std_logic;
    a, b : in std_logic_vector(4 downto 0);
    y: out std_logic_vector(4 downto 0)) ;
    end mux2_5;
    architecture first of mux2_5 is
    begin
    y <= a when s = '1' else
    b;
end first;  