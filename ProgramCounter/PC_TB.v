`timescale 1ns / 1ps
`include "ProgramCounter.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:17 04/10/2023
// Design Name:   ProgramCounter
// Module Name:   C:/Users/DSA Lab/Desktop/2021234/Lab_9/PC_TB.v
// Project Name:  Lab_9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_TB;

	// Inputs
	reg clk;
	reg reset;
	reg [19:0] offset;
	reg branch;

	// Outputs
	wire [15:0] count;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.clk(clk), 
		.reset(reset), 
		.offset(offset),
		.branch(branch),
		.count(count)
		
	);
always#1clk=~clk;
	initial begin

		$dumpfile("ProgramCounter.vcd");
        $dumpvars(0,PC_TB);
		// Initialize Inputs
		clk = 0;reset = 1;branch=0;offset=0;
		
		#2;
		reset=0;
		offset=24;
		branch=1;
		#5;
		branch=0;offset=0;
		#5
		reset=0;
		#2;
		

		// Wait 100 ns for global reset to finish
	$finish;        
		// Add stimulus here

	end
      
endmodule

