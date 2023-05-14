`timescale 1ns / 1ps
`include "ProgramCounter.v"

module PC_TB;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0]mem_to_reg;
	reg [20:0] offset;
	reg [31:0]reg_out1;
	reg zero_flag;
	reg branch;

	// Outputs
	wire [9:0] count;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.clk(clk), 
		.reset(reset), 
		.offset(offset),
		.branch(branch),
		.reg_out1(reg_out1),
		.mem_to_reg(mem_to_reg),
		.zero_flag(zero_flag),
		.count(count)
		
	);
always#1clk=~clk;
	initial begin

		$dumpfile("ProgramCounter.vcd");
        $dumpvars(0,PC_TB);
		// Initialize Inputs
		clk = 0;reset = 1;branch=0;offset=0;#2;
		

		reset=0;offset=24;branch=1;#2;


		branch=1;mem_to_reg=2'b11;offset=12;reg_out1=4;#5;
		#2;
		
	$finish;        
		

	end
      
endmodule

