`timescale 1ns/1ps

module alu_mux (clk,alu_src,reg2,imm,out);

input clk;
input alu_src;
input [31:0] reg2;
input [20:0]imm;
output reg [31:0] out;

always @(*) begin
    if(alu_src==1)
        out=imm;
    else if(alu_src==0)
        out=reg2;
end
    
endmodule
