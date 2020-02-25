library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
    port (clk, rst, start: in std_logic);
end test;

architecture rtl of test is
    component a_ram is
        port(clk, wr : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0));
    end component;
    component top_level is
        port (clk, rst, start : in std_logic;
        a_in : in std_logic_vector(7 downto 0);
        a_wr : out std_logic;
        addr : out std_logic_vector(3 downto 0);
        a_out : out std_logic_vector(7 downto 0));
    end component;
    signal a_wr : std_logic;
    signal addr : std_logic_vector(3 downto 0);
    signal a_in, a_out : std_logic_vector(7 downto 0);
    begin
        I_Sort : top_level port map (clk, rst, start, a_in, a_wr, addr, a_out);
        RAM : a_ram port map (clk, a_wr, addr, a_out, a_in);
    end rtl;
