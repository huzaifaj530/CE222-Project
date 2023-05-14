`timescale 1ns/1ps
`include "alu_mux.v"

module alu_mux_tb;

    reg clk;
    reg alu_src;
    reg [31:0] reg2;
    reg [20:0]imm;
    wire [31:0] out;

    alu_mux uut(clk,alu_src,reg2,imm,out);


always#1clk=~clk;
initial begin
    $dumpfile("alu_mux.vcd");
    $dumpvars(0,alu_mux_tb);

    clk=0;imm=20;reg2=15;#3;

    alu_src=0;#2;
    alu_src=1;#2;

    $finish;

end
endmodule