library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity a_ram is
port(clk, wr : in std_logic;
addr : in std_logic_vector(3 downto 0);
din : in std_logic_vector(7 downto 0);
dout : out std_logic_vector(7 downto 0));
end a_ram;
architecture rtl of a_ram is
type ram_type is array (0 to 15) of
std_logic_vector(7 downto 0);
signal program: ram_type := (
"00000000", -- sample contents
"10000000",
"11110000",
"11000011",
"11101110",
"10011111",
"11111110",
"11110101",
"10010000",
"10000000",
"11101000",
"10001111",
"10100000",
"10000000",
"01111000",
"00000000");
begin
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(addr))) <= din;
end if;
end if;
end process;
dout <= program(conv_integer(unsigned(addr)));
end rtl;
