library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CPU is
  port(
  CLK,Rst :in std_logic);
end CPU;    
architecture Arch of CPU is

component ram is
port (
clk : in std_logic;
R,W : in std_logic;
address : in std_logic_vector(15 downto 0);
datain : in std_logic_vector(15 downto 0);
dataout : out std_logic_vector(15 downto 0);
MFC:out std_logic);
end component;


component my_nreg is
Generic ( n : integer := 16);
port( Clk,Rst,ENA : in std_logic;
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end component;

component ALSU is 
  port(a1,a2 :in std_logic_vector(15 downto 0);
   s :in std_logic_vector(3 downto 0);
   Cin :in std_logic;
   outt :out std_logic_vector(15 downto 0);
   FLAGS:out std_logic_vector(3 downto 0) -- OV , C , Z , N
   );
end component;

component tri_state_buffer is
	Generic ( n : integer := 16);
    Port ( e   : in  STD_LOGIC;    -- single buffer enable
           Input  : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Output : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component Control_Unit is
  port(
    IR:in std_logic_vector(15 downto 0);
    CLK :in std_logic;
	Rst :in std_logic;
    R0in,R1in,R2in,R3in,
    R0out,R1out,R2out,R3out,
    PCout,MDRout,Zout,RSRCout,RDSTout,SOURCEout,DESTINout,TEMPout, --F1
    PCin,IRin,Zin,RSRCin,RDSTin,                                   --F2
    MARin,MDRin,TEMPin,                                            --F3
    Yin,SOURCEin,DESTINin,                                         --F4
    RD,WR,                                                    --F6
    CLEARY,                                                        --F7
    CARRYin,                                                       --F8
    FLAGS_E,
    HLT                                                           --F9   
    :out std_logic;
    ALSU_SIGNALS:out std_logic_vector(3 downto 0);
    CW : inout std_logic_vector(31 downto 0)                  --F5
  );
end component;

-----------------------------------------------

signal IR:std_logic_vector(15 downto 0);

 signal R0in,R1in,R2in,R3in,
		R0out,R1out,R2out,R3out,
		PCout,MDRout,Zout,RSRCout,RDSTout,SOURCEout,DESTINout,TEMPout, 
		PCin,IRin,Zin,RSRCin,RDSTin,                                   
		MARin,MDRin,TEMPin,                                            
		Yin,SOURCEin,DESTINin,                                         
		RD,WR,                                                   
		CLEARY,                                                        
		CARRYin,                                                       
		FLAGS_E,
    HLT                                                           
		:std_logic;
    ----------------------------------------------------
signal  ALSU_SIGNALS:std_logic_vector(3 downto 0);	-- ALSU sellection line
signal CW : std_logic_vector(31 downto 0);

signal mdrINPUT,ramOUT,buss,AfromY,Z,ramIN,ADD:std_logic_vector(15 downto 0);
signal R00out,R11out,R22out,R33out,Srcout,Destout,Tout,Z_value_out:std_logic_vector(15 downto 0);
signal Flags,True_flags:std_logic_vector(3 downto 0); 
signal mdrENABLE,MFC,CLRY,TMP_MFC,TMPclk:std_logic;
--------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------------------
begin
 TMPclk <= Clk when HLT ='0'
   else '0';
   
  MFC<='0' when Rst='1'
  else TMP_MFC;
  CLRY<=CLEARY or Rst;
 mdrINPUT<=ramOUT when MFC='1'
else buss when MDRin='1';
mdrENABLE<=MDRin or MFC;
CU:Control_Unit port map(
		IR,TMPclk,Rst,R0in,R1in,R2in,R3in,
		R0out,R1out,R2out,R3out,
		PCout,MDRout,Zout,RSRCout,RDSTout,SOURCEout,DESTINout,TEMPout, 
		PCin,IRin,Zin,RSRCin,RDSTin,                                   
		MARin,MDRin,TEMPin,                                            
		Yin,SOURCEin,DESTINin,                                         
		RD,WR,                                                   
		CLEARY,                                                        
		CARRYin,                                                       
		FLAGS_E,
    HLT,      
		ALSU_SIGNALS,
    CW);

---------------------------------------REGISTERS------------------------------------
TriR0:tri_state_buffer generic map(16) port map(R0out,R00out,buss);
TriR1:tri_state_buffer generic map(16) port map(R1out,R11out,buss);
TriR2:tri_state_buffer generic map(16) port map(R2out,R22out,buss);
TriR3:tri_state_buffer generic map(16) port map(R3out,R33out,buss);
SRc:tri_state_buffer generic map(16) port map(SOURCEout,Srcout,buss);
DEs:tri_state_buffer generic map(16) port map(DESTINout,Destout,buss);
TEm:tri_state_buffer generic map(16) port map(TEMPout,Tout,buss);
ZTri:tri_state_buffer generic map(16) port map(Zout,Z_value_out,buss);
MDRTri:tri_state_buffer generic map(16) port map(MDRout,ramIN,buss);

---------------------------------  General purpose Register ------------------
R0:my_nreg generic map(16) port map(TMPclk,Rst,R0in,buss,R00out);
R1:my_nreg generic map(16) port map(TMPclk,Rst,R1in,buss,R11out);
R2:my_nreg generic map(16) port map(TMPclk,Rst,R2in,buss,R22out);
PC:my_nreg generic map(16) port map(TMPclk,Rst,R3in,buss,R33out); --R3

 ------------------------------- special purpose register -----------------
Y:my_nreg generic map(16) port map(TMPclk,CLRY ,Yin,buss,AfromY);
SOURCE:my_nreg generic map(16) port map(TMPclk,Rst,SOURCEin,buss,Srcout);
DESTIN:my_nreg generic map(16) port map(TMPclk,Rst,DESTINin,buss,Destout);
tempREG:my_nreg generic map(16) port map(TMPclk,Rst,TEMPin,buss,Tout);
Z_ALU : my_nreg generic map(16) port map(TMPclk,Rst,Zin,Z,Z_value_out);
Flag_Reg:my_nreg generic map(4) port map(TMPclk,Rst,FLAGS_E,Flags,True_Flags);

MDR:my_nreg generic map(16) port map(TMPclk,Rst,mdrENABLE,mdrINPUT,ramIN);
MAR:my_nreg generic map(16) port map(TMPclk,Rst,MARin,buss,ADD);
IRReg:my_nreg generic map(16) port map(TMPclk,Rst,IRin,buss,IR);

-------------------------------------------------------------------------------------
ALU:ALSU port map(AfromY,buss,ALSU_SIGNALS,CARRYin,Z,Flags);
MEMORY:ram port map(TMPclk,RD,WR,ADD,ramIN,ramOUT,TMP_MFC);
end Arch;