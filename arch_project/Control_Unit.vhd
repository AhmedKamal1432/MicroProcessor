Library ieee;
use ieee.std_logic_1164.all;

entity Control_Unit is
  port(
    IR:in std_logic_vector(15 downto 0);
    CLK :in std_logic;
	Rst:in std_logic;
    R0in,R1in,R2in,R3in,
    R0out,R1out,R2out,R3out,
    PCout,MDRout,Zout,RSRCout,RDSTout,SOURCEout,DESTINout,TEMPout, --F1
    PCin,IRin,Zin,RSRCin,RDSTin,                                   --F2
    MARin,MDRin,TEMPin,                                            --F3
    Yin,SOURCEin,DESTINin,                                         --F4
    RD,WR,                                                    --F6
    CLEARY,                                                        --F7
    CARRYin,                                                       --F8
    FLAGS_E                                                           --F9   
    :out std_logic;
    ALSU_SIGNALS:out std_logic_vector(3 downto 0)                  --F5
  );
end Control_Unit;

Architecture Arch of Control_Unit is

component Decoding_Circuit is
port( 
Next_Add : in std_logic_vector(7 downto 0);
IR : in std_logic_vector(15 downto 0);
Or_Bits : in std_logic_vector(2 downto 0);
Pla: in std_logic ;
MAR : out std_logic_vector(7 downto 0));
end component;

component Control_Store is
  port(
  Rst,CLK:in std_logic;
  Add:in std_logic_vector(7 downto 0);
  Control_Word:out std_logic_vector(31 downto 0)
  );  
end component;

component my_3x8Decoder is
port( A0,A1,A2,E : in std_logic;
D : out std_logic_vector(7 downto 0));
end component;

component my_4x16Decoder is
port( A0,A1,A2,A3,E : in std_logic;
D : out std_logic_vector(15 downto 0));
end component;

component my_2x4Decoder is
port( A0,A1,E : in std_logic;
D : out std_logic_vector(3 downto 0));
end component;

component my_nreg is
Generic ( n : integer := 16);
port( Clk,Rst,ENA : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

signal CW:std_logic_vector(31 downto 0);
signal uAR,uARtmp:std_logic_vector(7 downto 0);
signal F1En:std_logic;
signal F2En:std_logic;
signal F1Dout:std_logic_vector(15 downto 0);
signal F2Dout:std_logic_vector(7 downto 0);
signal EnRso :std_logic;
signal EnRdo :std_logic;
signal EnRsi :std_logic;
signal EnRdi :std_logic;
signal PLA:std_logic;
signal DdstiOut:std_logic_vector(3 downto 0);
signal DdstoOut:std_logic_vector(3 downto 0);
signal DsrciOut:std_logic_vector(3 downto 0);
signal DsrcoOut:std_logic_vector(3 downto 0);
------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------------------
begin
  
  
  MicroPC:my_nreg generic map(8) port map(CLK,Rst,'1',uAR,uARtmp);
  PLA<=CW(0)and not Rst;
  F1En<=not Rst;
  F2En<=not Rst;
  CS_Label:Control_Store port map(Rst,CLK,uARtmp,CW);
  DC_Label:Decoding_Circuit port map(CW(31 downto 24),IR,CW(3 downto 1),CW(0),uAR);
  DRout:my_4x16Decoder port map(cw(23),cw(22),cw(21),CW(20),F1En,F1Dout);  
  DRin:my_3x8Decoder port map(cw(19),cw(18),cw(17),F2En,F2Dout);
---------------------------------------F1 Part------------------------------------------  
  PCout<=F1Dout(1);
  MDRout<=F1Dout(2);
  Zout<=F1Dout(3);
  RSRCout<=F1Dout(4);
  RDSTout<=F1Dout(5);
  SOURCEout<=F1Dout(8);
  DESTINout<=F1Dout(9);
  TEMPout<=F1Dout(10);
  ---------------------------------------------------------------------------------------
  EnRso<=F1Dout(4)and not Rst;
  EnRdo<=F1Dout(5)and not Rst;
  
  EnRsi<=F2Dout(4)and not Rst;
  EnRdi<=F2Dout(5)and not Rst;
  
  ---------------------------------------F2 Part------------------------------------------
  PCin<=F2Dout(1);
  IRin<=F2Dout(2);
  Zin<=F2Dout(3);
  RSRCin<=F2Dout(4);
  RDSTin<=F2Dout(5);
  ---------------------------------------------------------------------------------------
  
  Ddsti:my_2x4Decoder port map(IR(1),IR(0),EnRdi,DdstiOut); --Ri dest in
  Ddsto:my_2x4Decoder port map(IR(1),IR(0),EnRdo,DdstoOut); --Ri dest out
  Dsrci:my_2x4Decoder port map(IR(6),IR(5),EnRsi,DsrciOut); --Ri src in
  Dsrco:my_2x4Decoder port map(IR(6),IR(5),EnRso,DsrcoOut); --Ri src out
---------------------------------------Registers Part------------------------------------
  R0out<=DdstoOut(0) or DsrcoOut(0);
  R0in <=DdstiOut(0) or DsrciOut(0);

  R1out<=DdstoOut(1) or DsrcoOut(1);
  R1in <=DdstiOut(1) or DsrciOut(1);
  
  R2out<=DdstoOut(2) or DsrcoOut(2);
  R2in <=DdstiOut(2) or DsrciOut(2);

  R3out<=DdstoOut(3) or DsrcoOut(3);
  R3in <=DdstiOut(3) or DsrciOut(3);
 ----------------------------------------------------------------------------------------
 
 
 ---------------------------------------F3 Part------------------------------------------
 MARin<=cw(15) and not cw(16)and not Rst;
 MDRin<=cw(16) and not cw(15)and not Rst;
 TEMPin<=cw(15) and cw(16)and not Rst;
 ----------------------------------------------------------------------------------------
 
  ---------------------------------------F4 Part-----------------------------------------
 Yin<=cw(13) and not cw(14)and not Rst;
 SOURCEin<=cw(14) and not cw(13)and not Rst;
 DESTINin<=cw(13) and cw(14)and not Rst;
 ----------------------------------------------------------------------------------------
 
  ---------------------------------------F5 Part-----------------------------------------
 ALSU_SIGNALS<=cw(12 downto 9) when Rst='1'
 else (others=>'0');
 ----------------------------------------------------------------------------------------
 
  ---------------------------------------F6 Part-----------------------------------------
 RD<=cw(7) and not cw(8)and not Rst;
 WR<=cw(8) and not cw(7)and not Rst;
 ----------------------------------------------------------------------------------------
 
  ---------------------------------------F7 Part-----------------------------------------
 CLEARY<=cw(6)and not Rst;
 ----------------------------------------------------------------------------------------
 
  ---------------------------------------F8 Part-----------------------------------------
 CARRYin<=cw(5)and not Rst;
 ----------------------------------------------------------------------------------------
 
 ---------------------------------------F9 Part-----------------------------------------
 FLAGS_E<=cw(4)and not Rst;
 ----------------------------------------------------------------------------------------
 
 
 
end Arch;
