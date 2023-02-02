library ieee;
use ieee.std_logic_1164.all;

entity rca is
    port(
        a, b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end rca;

ARCHITECTURE structural OF rca IS
-- Full adder declaration 
COMPONENT fa
    port(
        a, b: in std_logic;
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic
    );
END COMPONENT;

-- carry declaration 
SIGNAL c1,c2,c3,c4,c5,c6,c7: std_logic;

BEGIN
--port mapping
FA0: fa PORT MAP(a(0), b(0), cin, c1, s(0));
FA1: fa PORT MAP(a(1), b(1), c1, c2, s(1));
FA2: fa PORT MAP(a(2), b(2), c2, c3, s(2));
FA3: fa PORT MAP(a(3), b(3), c3, c4, s(3));
FA4: fa PORT MAP(a(4), b(4), c4, c5, s(4));
FA5: fa PORT MAP(a(5), b(5), c5, c6, s(5));
FA6: fa PORT MAP(a(6), b(6), c6, c7, s(6));
FA7: fa PORT MAP(a(7), b(7), c7, cout, s(7));
END structural;