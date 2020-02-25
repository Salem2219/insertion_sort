library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity top_level is
    port (clk, rst, start : in std_logic;
    a_in : in std_logic_vector(7 downto 0);
    a_wr : out std_logic;
    addr : out std_logic_vector(3 downto 0);
    a_out : out std_logic_vector(7 downto 0));
end top_level;

architecture rtl of top_level is
    component dp is
        port (clk, rst, i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld : in std_logic;
        addr_sel : in std_logic_vector(1 downto 0);
        a_in : in std_logic_vector(7 downto 0);
        igrsz, temp1lta, jeq0 : out std_logic;
        addr : out std_logic_vector(3 downto 0);
        a_out : out std_logic_vector(7 downto 0));
    end component;
    component ctrl is
        port (clk,rst,start, igrsz, temp1lta, jeq0 : in std_logic ;
        i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld, a_wr: out std_logic;
        addr_sel : out std_logic_vector(1 downto 0));
    end component ;
    signal i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld, igrsz, temp1lta, jeq0 : std_logic;
    signal addr_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld, addr_sel, a_in, igrsz, temp1lta, jeq0, addr, a_out);
        control : ctrl port map (clk,rst,start, igrsz, temp1lta, jeq0, i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld, a_wr, addr_sel);
    end rtl;
