`timescale 1ns / 1ps
`include "reg_file.v"

module reg_file_tb;

reg clk,wr;
reg [4:0] r1,r2,rd; //5bit reg address of  the 3 registers for R-type
reg [31:0] write_data;// data written into destination register
wire [31:0] out1,out2;//

    reg_file uut (clk,wr,r1,r2,rd,write_data,out1,out2);
always#1clk=~clk;
initial begin

    $dumpfile("reg_file.vcd");
    $dumpvars(0,reg_file_tb);

    clk=0;#2;

    wr=0;#2;
    r1=1;r2=2;#2;

    wr=1;rd=3;write_data=7;#2;

    wr=0;#2;
    r1=3;r2=2;#2;


    $finish;

end
    
endmodule