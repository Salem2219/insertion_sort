library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
port (clk,rst,start, igrsz, temp1lta, jeq0 : in std_logic ;
i_ld, i_sel, j_ld, j_sel, aout_sel, temp1_ld, temp2_ld, a_wr: out std_logic;
addr_sel : out std_logic_vector(1 downto 0));
end ctrl ;

architecture rtl of ctrl is
  type state_type is (s0,s1,s2,s3,s4, s5, s6, s7, s8);
  signal current_state : state_type ;
  signal next_state : state_type ;
begin
  process(clk,rst)
  begin
    if (rst = '1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;

  process (current_state, start, igrsz, temp1lta, jeq0)
  begin
    case current_state is
    when s0 =>
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '0';
    addr_Sel <= "00";
    next_state <= s1;
    when s1 => -- i = 2
    i_ld <= '1';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '0';
    addr_Sel <= "00";
    if (start ='1') then
    next_state <= s2;
    else
    next_state <= s1;
    end if;
    when s2 => -- i != 16
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '0';
    addr_Sel <= "00";
    if (igrsz = '1') then
        next_state <= s1;
    else
        next_state <= s3;
    end if;
    when s3 => -- temp1 = a[i]; j = j - 1;
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '1';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '1';
    temp2_ld <= '0';
    a_wr <= '0';
    addr_Sel <= "00";
    next_state <= s4;
    when s4 => -- temp2 = a[j]
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '1';
    a_wr <= '0';
    addr_Sel <= "01";
    next_state <= s5;
    when s5 => -- j >= 1 && temp1 < temp2
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '0';
    addr_Sel <= "00";
    if ((temp1lta and (not(jeq0))) = '1') then
    next_state <= s6;
    else
    next_state <= s7;
    end if;
    when s6 => -- a[j+1] = temp2; j = j - 1;
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '1';
    j_sel <= '1';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '1';
    addr_Sel <= "10";
    next_state <= s8;
    when s7 => -- a[j+1] = temp1; i= i + 1;
    i_ld <= '1';
    i_sel <= '1';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '1';
    temp1_ld <= '0';
    temp2_ld <= '0';
    a_wr <= '1';
    addr_Sel <= "10";
    next_state <= s2;
    when others => -- temp2 = a[j];
    i_ld <= '0';
    i_sel <= '0';
    j_ld <= '0';
    j_sel <= '0';
    aout_sel <= '0';
    temp1_ld <= '0';
    temp2_ld <= '1';
    a_wr <= '0';
    addr_Sel <= "01";
    next_state <= s5;
    end case;
  end process;
end rtl;
