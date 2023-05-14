`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:37 04/10/2023 
// Design Name: 
// Module Name:    ProgramCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(
input clk,reset,
input [20:0]offset,
input branch,
input [31:0]reg_out1,
input [1:0]mem_to_reg,
input zero_flag,
output reg [9:0] count
);


always@(posedge clk)begin
	if(reset)
		count=0;
	else if(branch &&zero_flag && mem_to_reg==2'bx)
		count=count+offset;
	else if(branch && mem_to_reg==2'b11 )
		count=offset+reg_out1;//immediate + register 1
	else if(branch || mem_to_reg==2'b10 )//Btype or jal
		count=count+offset;//pc + immediate
	else
		count=count+1;//pc +4

end

endmodule
