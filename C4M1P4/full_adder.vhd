library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        a   : in  STD_LOGIC; -- Input bit a
        b   : in  STD_LOGIC; -- Input bit b
        ci  : in  STD_LOGIC; -- Carry-in
        s   : out STD_LOGIC; -- Sum output
        c0  : out STD_LOGIC  -- Carry-out output
    );
end full_adder;

architecture Behavioral of full_adder is
begin
    process(a, b, ci)
    begin
        s   <= a xor b xor ci;    -- Sum is the XOR of a, b, and ci
        c0  <= (a and b) or (ci and (a xor b)); -- Carry-out
    end process;
end Behavioral;
