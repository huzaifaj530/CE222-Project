`timescale 1ns / 1ps

module data_memory(read_data,clk,address,write_data,mem_rd,mem_wr);
input clk;
input [31:0] address;
input [31:0] write_data;
input mem_rd;
input mem_wr;

reg [31:0] memory[256:0];// 1023 locations of 4 bytes == 1024 bytes totals.
output reg [31:0] read_data;

always@(posedge clk)begin
	
	if(mem_rd==1)
		read_data=memory[address];
	if(mem_wr==1)
		memory[address]=write_data;

end

endmodule