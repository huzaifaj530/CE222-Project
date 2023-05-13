`timescale 1ns / 1ps
`include "alu.v"

module alu_tb;

    reg clk;
    reg [31:0] a,b;
    
    reg [2:0] alu_control;

    wire zero_flag;
    wire [31:0] out;

    alu uut(clk,a,b,out,alu_control,zero_flag);

always#1clk=~clk;
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);

    clk=0;a=3;b=2;#2;

    alu_control=3'b000;#2;// and
    alu_control=3'b001;#2;//or 
    alu_control=3'b010;#2;// add
    alu_control=3'b011;#2;// sub
    alu_control=3'b100;#2;// less then
    alu_control=3'b101;#2;//greter then or equal to
    alu_control=3'b110;#2;//equal to
    $finish;

end

    
endmodule