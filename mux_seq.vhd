Library ieee;

Use ieee.std_logic_1164.all;

Entity mux_seq is 

port ( a,b: in std_logic;
		s : in std_logic;
		x : out std_logic);
		
end mux_seq;



Architecture a_mux_seq of mux_seq is
begin
	
		x <= a when s='0' 
			
		else b when s='1' ;
		

end a_mux_seq;

 --SIGNAL bus : bit_vector(0 TO 7) := (4=>'1', OTHERS=>'0');  -- default value 
		-- of "bus" is B"0000_1000"