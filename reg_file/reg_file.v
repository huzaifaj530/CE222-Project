`timescale 1ns / 1ps

module reg_file (
input clk,wr,
input [4:0] r1,r2,rd, //5bit reg address of  the 3 registers for R-type
input [31:0] write_data,// data written into destination register
output reg [31:0] out1,out2// 
);

reg [31:0] registers [31:0];// 32 registers of 32 bit

always@(posedge clk)begin


    if(wr)
        registers[rd]=write_data;
    else begin
        out1=registers[r1];
        out2=registers[r2];
    end
        
end

endmodule