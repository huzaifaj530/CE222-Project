`timescale 1ns/1ps


module mem_mux(clk,mem_to_reg,alu_result,mem_data,pc,out);
input clk;
input [1:0]mem_to_reg;
input [31:0] alu_result;
input [31:0] mem_data;
input [9:0]pc;
output reg [31:0] out;

always @(posedge clk) begin
    if(mem_to_reg==1)
        out=mem_data;
    else if(mem_to_reg==0)
        out=alu_result;
    else if(mem_to_reg==2 || mem_to_reg==3)
        out=pc+1;//pc+4
end


endmodule