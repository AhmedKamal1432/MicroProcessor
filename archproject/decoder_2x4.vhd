Library ieee;
use ieee.std_logic_1164.all;
Entity decoder_2x4 is
port( A0,A1,E : in std_logic;
D : out std_logic_vector(3 downto 0));
end decoder_2x4;

Architecture decoder_2x4 of decoder_2x4 is
begin

D <= "0001" WHEN A1 = '0' and A0 = '0' and E = '1'
	else "0010" WHEN A1 = '0' and A0 = '1' and E = '1'
	else "0100" WHEN A1 = '1' and A0 = '0' and E = '1'
	else "1000" WHEN A1 = '1' and A0 = '1' and E = '1'
	else "0000";
end decoder_2x4;
