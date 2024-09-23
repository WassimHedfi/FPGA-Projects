library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity C4M1P1 is
    Port (
        SW : in STD_LOGIC_VECTOR(7 downto 0);  -- 8 switches SW7-0
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment display HEX0
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0)   -- 7-segment display HEX1
    );
end C4M1P1;

architecture Behavioral of C4M1P1 is

    -- Function to convert 4-bit binary to 7-segment display code
function BCD_to_7seg(bcd : in STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
begin
    case bcd is
        when "0000" => return "0111111"; -- 0
        when "0001" => return "0000110"; -- 1
        when "0010" => return "1011011"; -- 2
        when "0011" => return "1001111"; -- 3
        when "0100" => return "1100110"; -- 4
        when "0101" => return "1101101"; -- 5
        when "0110" => return "1111101"; -- 6
        when "0111" => return "0000111"; -- 7
        when "1000" => return "1111111"; -- 8
        when "1001" => return "1101111"; -- 9
        when others => return "0000000"; -- don't care values display nothing
    end case;
end function;


begin

    -- Convert SW3-0 to HEX0 display
    HEX0 <= BCD_to_7seg(SW(3 downto 0));

    -- Convert SW7-4 to HEX1 display
    HEX1 <= BCD_to_7seg(SW(7 downto 4));

end Behavioral;
