Library ieee;
Use ieee.std_logic_1164.all;

Entity n_Register is
Generic ( n : integer := 16);
port( clk,rst,e : in std_logic; --clock ,reset, enable(from decoder)
d : in std_logic_vector(n-1 downto 0);
q : out std_logic_vector(n-1 downto 0));
end n_Register;

Architecture n_Register of n_Register is
begin
Process (clk,rst)
begin
if rst = '1' then
q <= (others=>'0');
elsif rising_edge(clk) and e = '1' then -- i dont nead check enable because if tri_state_buffer in the output
q <= d;
end if;
end process;
end n_Register;
