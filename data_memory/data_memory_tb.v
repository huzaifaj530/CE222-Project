`timescale 1ns / 1ps
`include"data_memory.v"

module data_memory_tb;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] write_data;
	reg mem_rd;
	reg mem_wr;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.read_data(read_data), 
		.clk(clk), 
		.address(address), 
		.write_data(write_data), 
		.mem_rd(mem_rd), 
		.mem_wr(mem_wr)
	);
always#1clk=~clk;
	initial begin
		// Initialize Inputs
        $dumpfile("data_memory.vcd");
        $dumpvars(0,data_memory_tb);

		clk = 1;
		address = 0;
		write_data = 0;
		mem_rd = 0;
		mem_wr = 0;

		repeat(32)begin
			write_data=address+1;
			mem_wr=1;mem_rd=0;#5// writes
			mem_rd=1;mem_wr=0;#5//reads
			address=address+1;
		end

		$finish;

	end
      
endmodule