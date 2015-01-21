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
  signal br_enable  :std_logic;
  begin

  br_enable <= IR(15 downto 8) = "11000001" or (IR(15 downto 8) = "11000010" and !Zero_flag) or (IR(15 downto 8) = "11000011" and Zero_flag)  
    -- move to  101 when it tow operand
    temp <= "01000001" when IR(15 downto 14) = "00"
          -- HALT
          else  "00000100" when IR  = "1100000000000000"

          -- No operation
          else  "00000000" when IR  = "1100000000000001"

          -- conditional branch 214
          else "10001100" when IR(15 downto 11) = "11000"

          -- go to 202 in on operand instruction 
          else "10000010" when br_enable

          -- go to jsr 005
          else "00000101" when IR(15 downto 11) = "11001"
          -- go           

          else (others => '0');
    -- go to the addressing mode address  
    temp2(5 downto 3)<= IR(9 downto 7) when IR(15 downto 14) = "00"
                        else IR(4 downto 2) when IR(15 downto 14) = "10";

    MAR <= temp or temp2 when E='1'
          -- i doubt in this else
          else "00000000";
end a_Pla_Circuit;
