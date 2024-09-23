

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P2 is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);  -- Input V (SW3-0)
           HEX1 : out STD_LOGIC_VECTOR (6 downto 0); -- Output for d1 (7-segment)
           HEX0 : out STD_LOGIC_VECTOR (6 downto 0)); -- Output for d0 (7-segment)
end C4M1P2;

architecture Behavioral of C4M1P2 is

    signal A : STD_LOGIC_VECTOR (3 downto 0); -- Output A from circuit A
    signal z : STD_LOGIC; -- Comparator output (Z = 1 if V > 9)
    signal V : STD_LOGIC_VECTOR (3 downto 0); -- Input value V
	 signal d0 : STD_LOGIC_VECTOR (3 downto 0);
	 signal d1 : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Assign input V to SW
    V <= SW;

    -- Comparator logic (Z = 1 if V > 9)
    z <= '1' when V > "1001" else '0';

    -- Logic for Circuit A (Binary to Decimal Conversion for V > 9)
    A(3) <= '0'; -- A3 is always 0
    A(2) <= V(1) and V(2);
    A(1) <= not V(1);
    A(0) <= V(0);

    -- Multiplexer: select between V or A based on Z
   d0 <= V when z = '0' else A;
	d1 <= "0000" when z = '0' else "0001";
	
	HEX1 <= "1000000" when z = '0' else "1111001";
	
	HEX0 <=
        "1000000" when d0 = "0000" else -- 0
        "1111001" when d0 = "0001" else -- 1
        "0100100" when d0 = "0010" else -- 2
        "0110000" when d0 = "0011" else -- 3
        "0011001" when d0 = "0100" else -- 4
        "0010010" when d0 = "0101" else-- 5
        "0000010" when d0 = "0110" else-- 6
        "1111000" when d0 = "0111" else-- 7
        "0000000" when d0 = "1000" else-- 8
        "0011000" when d0 = "1001" else -- 9
		  "0000000";
	

	

end Behavioral;
