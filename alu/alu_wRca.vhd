library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity alu_wRCA is
    port(
        alu_inA, alu_inB: in std_logic_vector(7 downto 0);
        alu_op: in std_logic_vector(1 downto 0);
        alu_out: out std_logic_vector(7 downto 0);
        C: out std_logic;
        E: out std_logic;
        Z: out std_logic
    );
end alu_wRCA;

architecture dataflow of alu_wRCA is

component rca
    port(
        a, b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end component;

component cmp
    port(  a: in   std_logic_vector (7 downto 0);
            b: in   std_logic_vector (7 downto 0);
            e: out  std_logic);
end component;

signal andRes, notRes, adderRes, notB, inB, outRes : std_logic_vector(7 downto 0);
signal carryIn : std_logic;


begin

andRes <= alu_inA and alu_inB;
notRes <= not alu_inA;
notB   <= not alu_inB;

cmper: cmp port map(alu_inA, alu_inB, E);

with alu_op select inB <=
    notB when "11",
    alu_inB when others;

with alu_op select carryIn <=
    '1' when "11",
    '0' when others;

Adder: rca port map(alu_inA, inB, carryIn, adderRes, C);

with alu_op select outRes <=
    notRes   when "00",
    andRes   when "01",
    adderRes when others;

Z <= not (((outRes(0) or outRes(1)) or (outRes(2) or outRes (3))) or ((outRes(4) or outRes(5)) or (outRes(6) or outRes(7))));
alu_out <= outRes;

end dataflow;