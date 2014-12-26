Library ieee;
use ieee.std_logic_1164.all;
entity C is
  port( cin :in std_logic;
        a :in std_logic_vector(15 downto 0);
        s :in std_logic_vector(1 downto 0);
        f :out std_logic_vector(15 downto 0);
		FLAGS:out std_logic_vector(3 downto 0)
		);
end C;
architecture arch2 of C is
  signal fout:std_logic_vector(15 downto 0);
  begin
    fout<= '0'&a(15 downto 1) when  s(0)='0' and s(1) ='0' 
  else a(0)&a(15 downto 1) when  s(0)='1' and s(1) ='0'
  else cin & (a(15 downto 1)) when s(0)='0' and s(1) ='1'
  else a(15)&a(15 downto 1);
  f<=fout;
  FLAGS(0)<= a(15) xnor a(14);  
  FLAGS(1)<=a(0);
  FLAGS(2)<='1' when fout="0000000000000000"
  else '0';
  FLAGS(3)<=fout(15);
  end arch2;
