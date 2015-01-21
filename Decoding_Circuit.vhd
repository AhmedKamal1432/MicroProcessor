Library ieee;
use ieee.std_logic_1164.all;

Entity Decoding_Circuit is
  port( 
  Next_Add : in std_logic_vector(7 downto 0);
  IR : in std_logic_vector(15 downto 0);
  Or_Bits : in std_logic_vector(2 downto 0);
  Pla : in std_logic ;
  MAR : out std_logic_vector(7 downto 0)
  );
end Decoding_Circuit;

Architecture arch_Decoding_Circuit of Decoding_Circuit is
  
  -- signal intializtion 
  signal ORdst,ORindsrc,ORinddst,ORresult,OR2op,OR1opjmp,E : std_logic;
  signal temp : std_logic_vector(7 downto 0);
  signal MAR1 : std_logic_vector(7 downto 0);
  signal MAR2 : std_logic_vector(7 downto 0);
  

  component my_3x8Decoder is
    port( A0,A1,A2,E : in std_logic;
    D : out std_logic_vector(7 downto 0));
  end component;
  
  component Oring is
    port(
    IR : in std_logic_vector(15 downto 0);
    MAR_Old : in std_logic_vector(7 downto 0);  
    ORdst,ORindsrc,ORinddst,ORresult ,OR2op : in std_logic;
    MAR : out std_logic_vector(7 downto 0));
  end component;
  
  component Pla_Circuit is
    port(
    IR : in std_logic_vector(15 downto 0);
    E : in std_logic;
    MAR : out std_logic_vector(7 downto 0));
  end component;

  begin
    E <= Or_Bits(0) or OR_Bits(1) or OR_Bits(2) ; 
    Decoder : my_3x8Decoder port map(Or_Bits(2),Or_Bits(1),Or_Bits(0),E,temp);
    ORdst <= temp(1);
    ORindsrc <= temp(2);
    ORinddst <= temp(3);
    ORresult <= temp(4);
    OR2op <= temp(5);
    OR1opjmp <= temp(6);

    bit_Oring : Oring port map(IR,Next_Add,ORdst,ORindsrc,ORinddst,ORresult,OR2op,MAR1);
    pla_c : Pla_Circuit port map(IR,Pla,MAR2);
    MAR <= MAR1 or MAR2 ;  
end arch_Decoding_Circuit;

