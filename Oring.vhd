Library ieee;
use ieee.std_logic_1164.all;

Entity Oring is
  port(
  IR : in std_logic_vector(15 downto 0);
  MAR_Old : in std_logic_vector(7 downto 0);  
  ORdst,ORindsrc,ORinddst,ORresult,OR2op,OR1opjmp : in std_logic;
  MAR : out std_logic_vector(7 downto 0));
end Oring;

Architecture a_Oring of Oring is
  signal NIR7,NIR4,NIR3,NIR2,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8 : std_logic;
  signal op2MAR0,op2MAR1,op2MAR2,op2MAR3,   op1MAR0,op1MAR1,op1MAR2,op1MAR3 : std_logic;
  signal fopMAR0 , fopMAR1,fopMAR2,fopMAR3 ,f1op ,opjmp ,f21op ,fjsr ,frts: std_logic;
  begin
    MAR(0) <= MAR_Old(0) or temp4 or temp5 or temp6 or fopMAR0 or opjmp or frts;
    MAR(1) <= MAR_Old(1) or fopMAR1 or frts;
    MAR(2) <= MAR_Old(2) or fopMAR2;
    MAR(3) <= MAR_Old(3) or temp3 or fopMAR3 or fjsr;
    MAR(4) <= MAR_Old(4) or temp2 or f21op;
    MAR(5) <= MAR_Old(5) or temp1 or f1op;
    MAR(6) <= MAR_Old(6) or frts;
    MAR(7) <= MAR_Old(7);

    op1MAR0 <= OR2op and IR(5);
    op1MAR1 <= OR2op and IR(6);
    op1MAR2 <= OR2op and IR(7);
    op1MAR3 <= OR2op and IR(8);

    op2MAR0 <= OR2op and IR(10);
    op2MAR1 <= OR2op and IR(11);
    op2MAR2 <= OR2op and IR(12);
    op2MAR3 <= OR2op and IR(13);

    fopMAR0 <= (op1MAR0 and IR(15)) or (op2MAR0 and not IR(15));
    fopMAR1 <= (op1MAR1 and IR(15)) or (op2MAR1 and not IR(15));
    fopMAR2 <= (op1MAR2 and IR(15)) or (op2MAR2 and not IR(15));
    fopMAR3 <= (op1MAR3 and IR(15)) or (op2MAR3 and not IR(15));

    f1op <= OR2op and IR(15) and not IR(14);
    f21op <= OR2op and not IR(14);
    fjsr <= OR2op and IR(15) and IR(14);
    frts <= fjsr and IR(12);

    opjmp <= OR1opjmp and (IR(10) or IR(9));

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

end a_Oring;

