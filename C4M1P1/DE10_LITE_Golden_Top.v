module DE10_LITE_Golden_Top(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// VGA //////////
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,

	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,

	//////////// Arduino //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

// Outputs for HEX0 and HEX1
wire [6:0] HEX0_OUT;
wire [6:0] HEX1_OUT;

//=======================================================
//  Structural coding
//=======================================================

// Instantiate the VHDL module c4M1P1
C4M1P1 U1 (
    .SW(SW[7:0]),       // Connect SW[7:0] to the VHDL module
    .HEX0(HEX0_OUT),    // Connect the output of the VHDL module to the internal HEX0 wire
    .HEX1(HEX1_OUT)     // Connect the output of the VHDL module to the internal HEX1 wire
);

// Assign the 7-segment display outputs (common anode or cathode dependent)
assign HEX0 = {1'b1, ~HEX0_OUT};  // Use ~ if common anode
assign HEX1 = {1'b1, ~HEX1_OUT};  // Use ~ if common anode

// Remaining HEX2 to HEX5 can be left unconnected or used for other purposes
assign HEX2 = 8'b11111111;
assign HEX3 = 8'b11111111;
assign HEX4 = 8'b11111111;
assign HEX5 = 8'b11111111;

endmodule
