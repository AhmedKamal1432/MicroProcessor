Library ieee;
use ieee.std_logic_1164.all;
Entity my_3x8Decoder is
port( A0,A1,A2,E : in std_logic;
D : out std_logic_vector(7 downto 0));
end my_3x8Decoder;

Architecture a_my_3x8Decoder of my_3x8Decoder is
begin

D <= "00000001" WHEN A0 = '0' and A1 = '0' and A2='0' and E = '1'
	else "00000010" WHEN A0 = '0' and A1 = '0' and A2='1' and E = '1'
	else "00000100" WHEN A0 = '0' and A1 = '1' and A2='0' and E = '1'
	else "00001000" WHEN A0 = '0' and A1 = '1' and A2='1' and E = '1'
	else "00010000" WHEN A0 = '1' and A1 = '0' and A2='0' and E = '1'
 	else "00100000" WHEN A0 = '1' and A1 = '0' and A2='1' and E = '1'
 	else "01000000" WHEN A0 = '1' and A1 = '1' and A2='0' and E = '1'
 	else "10000000" WHEN A0 = '1' and A1 = '1' and A2='1' and E = '1'
 	else "00000000";  
end a_my_3x8Decoder;



