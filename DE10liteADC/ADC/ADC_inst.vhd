	component ADC is
		port (
			clk_clk                              : in  std_logic                     := 'X';             -- clk
			reset_reset_n                        : in  std_logic                     := 'X';             -- reset_n
			modular_adc_0_response_valid         : out std_logic;                                        -- valid
			modular_adc_0_response_startofpacket : out std_logic;                                        -- startofpacket
			modular_adc_0_response_endofpacket   : out std_logic;                                        -- endofpacket
			modular_adc_0_response_empty         : out std_logic_vector(0 downto 0);                     -- empty
			modular_adc_0_response_channel       : out std_logic_vector(4 downto 0);                     -- channel
			modular_adc_0_response_data          : out std_logic_vector(11 downto 0);                    -- data
			mm_bridge_0_s0_waitrequest           : out std_logic;                                        -- waitrequest
			mm_bridge_0_s0_readdata              : out std_logic_vector(15 downto 0);                    -- readdata
			mm_bridge_0_s0_readdatavalid         : out std_logic;                                        -- readdatavalid
			mm_bridge_0_s0_burstcount            : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			mm_bridge_0_s0_writedata             : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			mm_bridge_0_s0_address               : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			mm_bridge_0_s0_write                 : in  std_logic                     := 'X';             -- write
			mm_bridge_0_s0_read                  : in  std_logic                     := 'X';             -- read
			mm_bridge_0_s0_byteenable            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			mm_bridge_0_s0_debugaccess           : in  std_logic                     := 'X'              -- debugaccess
		);
	end component ADC;

	u0 : component ADC
		port map (
			clk_clk                              => CONNECTED_TO_clk_clk,                              --                    clk.clk
			reset_reset_n                        => CONNECTED_TO_reset_reset_n,                        --                  reset.reset_n
			modular_adc_0_response_valid         => CONNECTED_TO_modular_adc_0_response_valid,         -- modular_adc_0_response.valid
			modular_adc_0_response_startofpacket => CONNECTED_TO_modular_adc_0_response_startofpacket, --                       .startofpacket
			modular_adc_0_response_endofpacket   => CONNECTED_TO_modular_adc_0_response_endofpacket,   --                       .endofpacket
			modular_adc_0_response_empty         => CONNECTED_TO_modular_adc_0_response_empty,         --                       .empty
			modular_adc_0_response_channel       => CONNECTED_TO_modular_adc_0_response_channel,       --                       .channel
			modular_adc_0_response_data          => CONNECTED_TO_modular_adc_0_response_data,          --                       .data
			mm_bridge_0_s0_waitrequest           => CONNECTED_TO_mm_bridge_0_s0_waitrequest,           --         mm_bridge_0_s0.waitrequest
			mm_bridge_0_s0_readdata              => CONNECTED_TO_mm_bridge_0_s0_readdata,              --                       .readdata
			mm_bridge_0_s0_readdatavalid         => CONNECTED_TO_mm_bridge_0_s0_readdatavalid,         --                       .readdatavalid
			mm_bridge_0_s0_burstcount            => CONNECTED_TO_mm_bridge_0_s0_burstcount,            --                       .burstcount
			mm_bridge_0_s0_writedata             => CONNECTED_TO_mm_bridge_0_s0_writedata,             --                       .writedata
			mm_bridge_0_s0_address               => CONNECTED_TO_mm_bridge_0_s0_address,               --                       .address
			mm_bridge_0_s0_write                 => CONNECTED_TO_mm_bridge_0_s0_write,                 --                       .write
			mm_bridge_0_s0_read                  => CONNECTED_TO_mm_bridge_0_s0_read,                  --                       .read
			mm_bridge_0_s0_byteenable            => CONNECTED_TO_mm_bridge_0_s0_byteenable,            --                       .byteenable
			mm_bridge_0_s0_debugaccess           => CONNECTED_TO_mm_bridge_0_s0_debugaccess            --                       .debugaccess
		);

