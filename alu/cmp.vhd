library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmp is
    Port(a       : in  std_logic_vector(7 downto 0);
         b       : in  std_logic_vector(7 downto 0);
         e   : out std_logic);
end cmp;

architecture dataflow of cmp is 
begin
e <= (a(0) xnor b(0)) and (a(1) xnor b(1)) and(a(2) xnor b(2)) and
	   (a(3) xnor b(3)) and (a(4) xnor b(4)) and (a(5) xnor b(5)) and
	   (a(6) xnor b(6)) and (a(7) xnor b(7));
	   
end dataflow;