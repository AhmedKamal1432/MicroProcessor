library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
	Generic ( n : integer := 16);
    Port ( e   : in  STD_LOGIC;    -- enable
           input  : in  STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0));
end tri_state_buffer;

architecture Arch of tri_state_buffer is

begin

    output <= input when (e = '1') else (others=>'Z');

end Arch;