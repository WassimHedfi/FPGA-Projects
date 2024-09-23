

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P4 is
    Port (
        x       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input a
        y       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input b
        cin      : in  STD_LOGIC; -- Carry-in
        s     : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit sum output
        cout : out STD_LOGIC; -- Final carry-out
		  HEX1 : out STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment output for tens digit
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);   -- 7-segment output for ones digit
		  HEX3 : out STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment output for tens digit
        HEX5 : out STD_LOGIC_VECTOR(6 downto 0)   -- 7-segment output for ones digit
    );
end C4M1P4;

architecture Behavioral of C4M1P4 is

	 signal A : STD_LOGIC_VECTOR (3 downto 0); -- Output A from circuit A
    signal z1 : STD_LOGIC; -- Comparator output (Z = 1 if V > 9)
    signal z2 : STD_LOGIC; -- Comparator output (Z = 1 if V > 8)
    signal V : STD_LOGIC_VECTOR (3 downto 0); -- Input value V
	 signal d0 : STD_LOGIC_VECTOR (3 downto 0);
	 signal cout_internal : STD_LOGIC; -- Internal signal for the carry-out


	 
	-- signal d1 : STD_LOGIC_VECTOR (3 downto 0);
	 
	 
    -- Instantiate 4 full adders
    component four_bit_adder
        Port (
        a       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input a
        b       : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input b
        cin      : in  STD_LOGIC; -- Carry-in
        s     : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit sum output
        cout : out STD_LOGIC -- Final carry-out
        );
    end component;
    
begin
    -- Instantiate full adders and connect them
	U1 : four_bit_adder port map (x, y, cin, V, cout_internal);
	
	 s <= V;
	 cout <= cout_internal;

    -- Comparator logic (Z = 1 if V > 9)
    z1 <= '1' when V > "1001" else '0';

    z2 <= '1' when V > "1000" else '0';
	 
    -- Logic for Circuit A (Binary to Decimal Conversion for V > 9)
    A(3) <= '0'; -- A3 is always 0
    A(2) <= V(1) and V(2);
    A(1) <= not V(1);
    A(0) <= V(0);

    -- Multiplexer: select between V or A based on Z
   
	--d1 <= "0000" when z = '0' else "0001";
		HEX3 <= 
			"1000000" when x = "0000" else -- 0
			"1111001" when x = "0001" else -- 1
			"0100100" when x = "0010" else -- 2
			"0110000" when x = "0011" else -- 3
			"0011001" when x = "0100" else -- 4
			"0010010" when x = "0101" else -- 5
			"0000010" when x = "0110" else -- 6
			"1111000" when x = "0111" else -- 7
			"0000000" when x = "1000" else -- 8
			"0011000" when x = "1001" else -- 9
			"1111111"; -- Default case

			
			
		HEX5 <= 
			"1000000" when y = "0000" else -- 0
			"1111001" when y = "0001" else -- 1
			"0100100" when y = "0010" else -- 2
			"0110000" when y = "0011" else -- 3
			"0011001" when y = "0100" else -- 4
			"0010010" when y = "0101" else -- 5
			"0000010" when y = "0110" else -- 6
			"1111000" when y = "0111" else -- 7
			"0000000" when y = "1000" else -- 8
			"0011000" when y = "1001" else -- 9
			"1111111"; -- Default case

			
			
			
	process(cout_internal, V)
	begin
		
		if cout_internal = '0' then
	
			
			if z1 ='0' then
			HEX1 <= "1000000";
			d0 <= V;
			else 
			HEX1 <= "1111001";
			d0 <= A;
			end if;

			case d0 is
				when "0000" => 
					HEX0 <= "1000000"; -- 0
				when "0001" => 
					HEX0 <= "1111001"; -- 1
				when "0010" => 
					HEX0 <= "0100100"; -- 2
				when "0011" => 
					HEX0 <= "0110000"; -- 3
				when "0100" => 
					HEX0 <= "0011001"; -- 4
				when "0101" => 
					HEX0 <= "0010010"; -- 5
				when "0110" => 
					HEX0 <= "0000010"; -- 6
				when "0111" => 
					HEX0 <= "1111000"; -- 7
				when "1000" => 
					HEX0 <= "0000000"; -- 8
				when "1001" => 
					HEX0 <= "0011000"; -- 9
				when others => 
					HEX0 <= "1111111"; -- Default case
			end case;

				
		else
	
			if V = "1001" then
				HEX1 <= "1111001";
				HEX0 <= "1000000";
			else
				
				if z2 ='0' then
					HEX1 <= "1000000";
					d0 <= V;
				else 
					HEX1 <= "1111001";
					d0 <= A;
				end if;
				
				
				case d0 is
						when "0000" => 
							HEX0 <= "1111001"; -- 0
						when "0001" => 
							HEX0 <= "0100100"; -- 1
						when "0010" => 
							HEX0 <= "0110000"; -- 2
						when "0011" => 
							HEX0 <= "0011001"; -- 3
						when "0100" => 
							HEX0 <= "0010010"; -- 4
						when "0101" => 
							HEX0 <= "0000010"; -- 5
						when "0110" => 
							HEX0 <= "1111000"; -- 6
						when "0111" => 
							HEX0 <= "0000000"; -- 7
						when "1000" => 
							HEX0 <= "0011000"; -- 8
						when others => 
							HEX0 <= "1111111"; -- Default case
				end case;
		
			end if;
		end if;
	end process;
    
end Behavioral;




