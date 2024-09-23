
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity C4M1P5 is
    Port (
        SW    : in  STD_LOGIC_VECTOR (8 downto 0); -- Switches SW8-SW0
        LEDR  : out STD_LOGIC_VECTOR (9 downto 0); -- Red LEDs LEDR9-LEDR0
        HEX5  : out STD_LOGIC_VECTOR (6 downto 0); -- 7-segment display for A
        HEX3  : out STD_LOGIC_VECTOR (6 downto 0); -- 7-segment display for B
        HEX1  : out STD_LOGIC_VECTOR (6 downto 0); -- 7-segment display for S1
        HEX0  : out STD_LOGIC_VECTOR (6 downto 0)  -- 7-segment display for S0
    );
end C4M1P5;

architecture Behavioral of C4M1P5 is
    signal A, B : STD_LOGIC_VECTOR (3 downto 0);
    signal cin  : STD_LOGIC;
    signal T0   : UNSIGNED(4 downto 0);
    signal Z0   : UNSIGNED(4 downto 0);
    signal S0   : STD_LOGIC_VECTOR (3 downto 0);
    signal S1   : STD_LOGIC;
    signal c1   : STD_LOGIC;
    signal SubResult : UNSIGNED(4 downto 0); -- Intermediate signal
begin

    -- Assign inputs
    A   <= SW(7 downto 4);
    B   <= SW(3 downto 0);
    cin <= SW(8);

    -- Line 1: T0 = A + B + c0
	 T0 <= ('0' & UNSIGNED(A)) + ('0' & UNSIGNED(B)) + ("0000" & cin);


    -- Lines 2-8: if (T0 > 9) then Z0 = 10; c1 = 1; else Z0 = 0; c1 = 0; end if
    process(T0)
    begin
        if T0 > 9 then
            Z0 <= "01010";  -- Z0 = 10 in binary
            c1 <= '1';
        else
            Z0 <= "00000";  -- Z0 = 0 in binary
            c1 <= '0';
        end if;
    end process;

    -- Line 9: S0 = T0 - Z0
    SubResult <= T0 - Z0;

    -- Line 9: S0 = T0 - Z0 (slice the result and convert to STD_LOGIC_VECTOR)
    S0 <= STD_LOGIC_VECTOR(SubResult(3 downto 0));

    -- Line 10: S1 = c1
    S1 <= c1;

    -- Error checking for invalid BCD inputs
    LEDR(9) <= '1' when (A > "1001") or (B > "1001") else '0';

    -- Display results on HEX displays
    LEDR(3 downto 0) <= S0;
    LEDR(4) <= S1;

    -- Assign 7-segment display outputs for A (on HEX5)
    HEX5 <= "1000000" when A = "0000" else -- Display 0
            "1111001" when A = "0001" else -- Display 1
            "0100100" when A = "0010" else -- Display 2
            "0110000" when A = "0011" else -- Display 3
            "0011001" when A = "0100" else -- Display 4
            "0010010" when A = "0101" else -- Display 5
            "0000010" when A = "0110" else -- Display 6
            "1111000" when A = "0111" else -- Display 7
            "0000000" when A = "1000" else -- Display 8
            "0010000" when A = "1001" else -- Display 9
            "1111111"; -- Default blank display

    -- Assign 7-segment display outputs for B (on HEX3)
    HEX3 <= "1000000" when B = "0000" else -- Display 0
            "1111001" when B = "0001" else -- Display 1
            "0100100" when B = "0010" else -- Display 2
            "0110000" when B = "0011" else -- Display 3
            "0011001" when B = "0100" else -- Display 4
            "0010010" when B = "0101" else -- Display 5
            "0000010" when B = "0110" else -- Display 6
            "1111000" when B = "0111" else -- Display 7
            "0000000" when B = "1000" else -- Display 8
            "0010000" when B = "1001" else -- Display 9
            "1111111"; -- Default blank display

    -- Assign 7-segment display outputs for S1 (on HEX1)
    HEX1 <= "1000000" when S1 = '0' else -- Display 0
            "1111001" when S1 = '1' else -- Display 1
            "1111111"; -- Default blank display

    -- Assign 7-segment display outputs for S0 (on HEX0)
    HEX0 <= "1000000" when S0 = "0000" else -- Display 0
            "1111001" when S0 = "0001" else -- Display 1
            "0100100" when S0 = "0010" else -- Display 2
            "0110000" when S0 = "0011" else -- Display 3
            "0011001" when S0 = "0100" else -- Display 4
            "0010010" when S0 = "0101" else -- Display 5
            "0000010" when S0 = "0110" else -- Display 6
            "1111000" when S0 = "0111" else -- Display 7
            "0000000" when S0 = "1000" else -- Display 8
            "0010000" when S0 = "1001" else -- Display 9
            "1111111"; -- Default blank display

end Behavioral;




