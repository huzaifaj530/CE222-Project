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
output reg [15:0] count
);


always@(posedge clk)begin
	if(reset)
		count=0;
	if(branch)
		count=count+offset;
	else
		count=count+4;

end

endmodule
