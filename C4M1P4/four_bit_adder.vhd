library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_adder is
    Port (
        a       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input a
        b       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input b
        cin      : in  STD_LOGIC; -- Carry-in
        s     : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit sum output
        cout : out STD_LOGIC -- Final carry-out
    );
end four_bit_adder;

architecture Behavioral of four_bit_adder is
    signal carry : STD_LOGIC_VECTOR(3 downto 0); -- Internal carry signals

    -- Instantiate 4 full adders
    component full_adder
        Port (
            a   : in  STD_LOGIC;
            b   : in  STD_LOGIC;
            ci  : in  STD_LOGIC;
            s   : out STD_LOGIC;
            c0  : out STD_LOGIC
        );
    end component;
    
begin
    -- Instantiate full adders and connect them
    FA0: full_adder port map (a(0), b(0), cin, s(0), carry(0));
    FA1: full_adder port map (a(1), b(1), carry(0), s(1), carry(1));
    FA2: full_adder port map (a(2), b(2), carry(1), s(2), carry(2));
    FA3: full_adder port map (a(3), b(3), carry(2), s(3), cout);
    
end Behavioral;
