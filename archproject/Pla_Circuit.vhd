Library ieee;
use ieee.std_logic_1164.all;

Entity Pla_Circuit is
port(
  IR : in std_logic_vector(15 downto 0);
  E : in std_logic;
  MAR : out std_logic_vector(7 downto 0));
end Pla_Circuit;

Architecture a_Pla_Circuit of Pla_Circuit is

  signal temp :std_logic_vector(7 downto 0);
  signal temp2 :std_logic_vector(7 downto 0):="00000000";

  begin
    -- move to  101 when it tow operand
    temp <= "01000001" when IR(15 downto 14) = "00"
          -- HALT
          else  "00000100" when IR  = "1100000000000000"
          -- No operation
          else  "00000000" when IR  = "1100000000000001"
          else (others => '0');
    -- go to the addressing mode address  
    temp2(5 downto 3)<= IR(9 downto 7) when IR(15 downto 14) = "00"
      else  IR(2 downto 0);

    MAR <= temp or temp2 when E='1'
          -- i doubt in this else
          else "00000000";
end a_Pla_Circuit;
