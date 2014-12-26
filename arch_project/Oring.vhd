Library ieee;
use ieee.std_logic_1164.all;

Entity Oring is
  port(
  IR : in std_logic_vector(15 downto 0);
  MAR_Old : in std_logic_vector(7 downto 0);  
  ORdst,ORindsrc,ORinddst,ORresult,OR2op : in std_logic;
  MAR : out std_logic_vector(7 downto 0));
end Oring;

Architecture a_Oring of Oring is
  signal NIR7,NIR4,NIR3,NIR2,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8 : std_logic;
  begin
    MAR(1) <= MAR_Old(1) or (OR2op and IR(11));
    MAR(2) <= MAR_Old(2) or (OR2op and IR(12));
    MAR(6) <= MAR_Old(6);
    MAR(7) <= MAR_Old(7);

    NIR7 <= not IR(7);
    NIR4 <= not IR(4);
    NIR3 <= not IR(3);
    NIR2 <= not IR(2);

    temp1 <= ORdst and IR(4); 
    temp2 <= ORdst and IR(3);
    temp3 <= ORdst and NIR4 and NIR3 and IR(2);
    temp4 <= NIR4 and NIR3 and NIR2 and ORresult;
    temp5 <= NIR7 and ORindsrc;
    temp6 <= NIR2 and ORinddst; 
    temp7 <= OR2op and IR(10); 
    temp8 <= OR2op and IR(13);

    MAR(5) <= MAR_Old(5) or temp1;
    MAR(4) <= MAR_Old(4) or temp2;
    MAR(3) <= MAR_Old(3) or temp3 or temp8;
    MAR(0) <= MAR_Old(0) or temp4 or temp5 or temp6 or temp7;
end a_Oring;

