Library ieee;
use ieee.std_logic_1164.all;
entity A is
  port(aa,b :in std_logic_vector(15 downto 0);
        cin :in std_logic;
        s :in std_logic_vector(1 downto 0);
        f :out std_logic_vector(15 downto 0);
        FLAGSA:out std_logic_vector(3 downto 0)
        );
end A;
architecture arch10 of A is
 component my_nadder is
       generic (n : integer := 16);
port   (a, b : in std_logic_vector(n-1  downto 0) ;
             cin : in std_logic;  
             s : out std_logic_vector(n-1 downto 0);             
             cout : out std_logic);
end component;
  signal temp,invb ,t:std_logic_vector(15 downto 0);
  signal tempc,tc :std_logic;
  
  begin
  invb<=(others => '0') when s(0)='0' and s(1) ='0' -- ((s(1 downto 0) = "00") or ((s(1 downto 0) = "11")
  else b when  s(0)='1' and s(1) ='0' 
  else not b when s(0)='0' and s(1) ='1'
  else (others => '1');
  
  u0:my_nadder port map(aa,invb,cin,t,tc);
 
  tempc<= '0' when cin='1' and s(0)='1' and s(1) ='1'
 else tc;
  temp<= (others => '0')  when cin='1' and s(0)='1' and s(1) ='1' -- f<= (others => '0')
  else t;
  f<=temp;
  FLAGSA(0)<= temp(15) xor (aa(15) xnor invb(15));  
  FLAGSA(1)<=tempc;
  FLAGSA(2)<='1' when temp= "0000000000000000"
  else '0';
  FLAGSA(3)<=temp(15);
  end arch10;

