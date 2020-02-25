library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity mux4_4 is
port (sel: in std_logic_vector (1 downto 0);
a, b, c, d: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0));
end mux4_4;

architecture third of mux4_4 is
    begin
    process (sel, a, b, c, d)
    begin
    if (sel = "00") then
    y <= a;
    elsif (sel = "01") then
    y <= b;
    elsif (sel = "10") then
    y <= c;
    else
    y <= d;
    end if;
    end process;
    end third;