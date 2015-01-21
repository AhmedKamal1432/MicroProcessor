Library ieee;
use ieee.std_logic_1164.all;

Entity Pla_Circuit is
port(
  IR : in std_logic_vector(15 downto 0);
  E : in std_logic;
  MAR : out std_logic_vector(7 downto 0); 
  FLAGS:in std_logic_vector(3 downto 0)
  );
end Pla_Circuit;

Architecture a_Pla_Circuit of Pla_Circuit is

  signal temp :std_logic_vector(7 downto 0);
  signal temp2 :std_logic_vector(7 downto 0):="00000000";
  signal log,log2 ,Br_Enable,Z:std_logic;

  begin
  Z<=FLAGS(2);
  Br_Enable<='1' when IR(15 downto 8)="11000001" or (IR(15 downto 8)="11000010" and Z='0') or(IR(15 downto 8)="11000011" and Z='1')
    else '0';
	-- move to  101 when it tow operand
    temp <= "01000001" when IR(15 downto 14) = "00"
          -- HALT
          else  "00000100" when IR  = "1100000000000000"

          -- No operation
          else  "00000000" when IR  = "1100000000000001"

          -- conditional branch 214
          else "10001100" when Br_Enable='1'

          -- go to 201 in one operand instruction 
          else "10000001" when IR(15 downto 14) = "10"
		  
		  -- go to 201 ( JSR )
		  else "10000001" when IR(15 downto 7)="110010000"
		  
		   -- go to 201 ( RTS )
		  else "10000001" when IR(15 downto 7)="110100000"
          
          else (others => '0');
    -- go to the addressing mode address  
	log<= not IR(9) and not IR(8) and IR(7);
	log2<=not IR(4) and not IR(3) and IR(2);
    temp2(5 downto 3)<= IR(9 downto 8)&log when IR(15 downto 14) = "00"
                        else IR(4 downto 3)&log2 when IR(15 downto 14) = "10"
						else IR(4 downto 3)&log2 when IR(15 downto 7)="110010000"
						else IR(4 downto 3)&log2 when IR(15 downto 7)="110100000"
						else "000";
    MAR <= temp or temp2 when E='1'
          -- i doubt in this else
          else "00000000";
end a_Pla_Circuit;
