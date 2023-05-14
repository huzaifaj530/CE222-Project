`timescale 1ns/1ps


module mem_mux(clk,mem_to_reg,alu_result,mem_data,out);
input clk;
input mem_to_reg;
input [31:0] alu_result;
input [31:0] mem_data;
output reg [31:0] out;

always @(posedge clk) begin
    if(mem_to_reg==1)
        out=mem_data;
    else if(mem_to_reg==0)
        out=alu_result;
end


endmodule