`timescale 1ns / 1ps
`include "instruction_memory.v"

module instruction_memory_tb;

	// Inputs
	reg clk;
	reg [31:0] read_addr;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.clk(clk), 
		.read_addr(read_addr), 
		.instruction(instruction)
	);
always#1clk=~clk;
	initial begin
        $dumpfile("instruction_memory.vcd");
        $dumpvars(0,instruction_memory_tb);
		// Initialize Inputs
		clk = 1;
		read_addr = 0;
		#5;
		
		
		
		$finish;
        
		// Add stimulus here

	end
      
endmodule