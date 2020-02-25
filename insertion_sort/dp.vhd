library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld : in std_logic;
    addr_sel : in std_logic_vector(1 downto 0);
    a_in : in std_logic_vector(7 downto 0);
    igrsz, temp1lta, jeq0 : out std_logic;
    addr : out std_logic_vector(3 downto 0);
    a_out : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
    component adder4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component adder5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component comp4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component compless8 is
        port (a, b : in std_logic_vector(7 downto 0);
        y : out std_logic);
    end component;
    component mux2_4 is
        port (s: in std_logic;
        a, b : in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)) ;
    end component;
    component mux2_5 is
        port (s: in std_logic;
        a, b : in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0)) ;
    end component;
    component mux2_8 is
        port (s: in std_logic;
        a, b : in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0)) ;
    end component;
    component mux4_4 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0));
    end component;
    component reg4 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component reg5 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(4 downto 0);
        reg_out: out std_logic_vector(4 downto 0));
    end component;
    component reg8 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(7 downto 0);
        reg_out: out std_logic_vector(7 downto 0));
    end component;
    component sub4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    signal i, i_in, iplus1: std_logic_vector(4 downto 0);
    signal temp1, temp2 : std_logic_vector(7 downto 0);
    signal j, j_in, ij, jplus1 : std_logic_vector(3 downto 0);
    begin
        igrsz <= i(4);
        i_reg : reg5 port map (clk, rst, i_ld, i_in, i);
        i_mux : mux2_5 port map (i_sel, iplus1, "00010", i_in);
        i_adder : adder5 port map (i, "00001", iplus1);
        addr_mux : mux4_4 port map (addr_sel, i(3 downto 0), j, jplus1, "0000", addr);
        j_adder : adder4 port map (j, "0001", jplus1);
        temp1_reg : reg8 port map (clk, rst, temp1_ld, a_in, temp1);
        temp2_reg : reg8 port map (clk, rst, temp2_ld, a_in, temp2);
        j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
        ij_sub : sub4 port map (ij, "0001", j_in);
        ij_mux : mux2_4 port map (j_sel, j, i(3 downto 0), ij);
        j0_comp : comp4 port map (j, "0000", jeq0);
        temp1a_compless : compless8 port map(temp1, temp2, temp1lta);
        a_out_mux : mux2_8 port map (aout_sel, temp1, temp2, a_out);
    end rtl;
    


