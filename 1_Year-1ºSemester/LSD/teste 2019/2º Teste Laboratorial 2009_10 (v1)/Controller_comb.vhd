-- Descrição Comportamental

library ieee; 
use ieee.std_logic_1164.all;

-- Declaração da entidade 
entity Controller_comb is 
	port (s1, s0, b, m, c: in std_logic; 
		  n1, n0, dar_b, dar_m, dar_c: out std_logic
		  ); 
end Controller_comb;

-- Descrição do comportamento da entidade 
architecture behavior of Controller_comb is 
begin 
	next_state: process(s1,s0,b,m,c) is 
	begin
		n1 <= (not(s1) and not(s0) and not(b) and m) or (not(s1) and s0 and c) or (s1 and not(s0));
		n0 <= (not(s1) and not(s0) and b) or (not(s1) and s0) or (s1 and not(s0) and c);
	end process next_state;
	
	saidas: process(s1,s0) is
	begin
		dar_b <= not(s1) and s0;
		dar_m <= s1 and not(s0);
		dar_c <= s1 and s0;
	end process saidas;
end behavior;