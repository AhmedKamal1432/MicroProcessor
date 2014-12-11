library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


Entity Control_Store is
  port(
    clk : in std_logic;
    Add:in std_logic_vector(7 downto 0);
    Control_Word:out std_logic_vector(31 downto 0));  
end Control_Store;

architecture Control_Store of Control_Store is
  type ram_type is array(0 to 1024) of std_logic_vector(31 downto 0);

  signal rom : ram_type := ( 
    000  =>  "00000001000101101000000011100000", 
    001  =>  "00000010001100100000000000010000", 
    002  =>  "00000011001001000000000000000000", 
    003  =>  "00000000000000000000000000000001", 
    081  =>  "01010010010001101000000011100000", 
    082  =>  "01110110001110000000000000010100", 
    118  =>  "01110111001000001000000010010000", 
    119  =>  "10000001001000000100000000000010", 
    129  =>  "10111000010100000010000000000000", 
    184  =>  "10111010100001100000000000001000", 
    186  =>  "10111010001101000000000000000000", 
    others =>  "00000000000000000000000000000000"   
  );

begin
 process(clk) is
    Begin
    if rising_edge(clk) then  
      Control_Word <= rom(to_integer(unsigned(Add)));
    end if;
  end process;
end Control_Store;