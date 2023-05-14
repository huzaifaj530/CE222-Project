`timescale 1ns / 1ps

module reg_file (
input clk,wr,
input [4:0] r1,r2,rd, //5bit reg address of  the 3 registers for R-type
input [31:0] write_data,// data written into destination register
output [31:0] out1,out2// 
);

reg [31:0] registers [31:0];// 32 registers of 32 bit

always@(posedge clk)begin
    registers[0]=0;// register 0 stays 0


    //Temp data for debug
	registers[1]=5;
	registers[2]=6;
	registers[3]=1;
	registers[4]=2;
	registers[5]=11;
	registers[6]=1;
	registers[7]=3;
	registers[8]=4;

    if(wr)
        registers[rd]=write_data;
        
end
    assign out1=registers[r1];
    assign out2=registers[r2];

endmodule