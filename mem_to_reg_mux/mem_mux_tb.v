`timescale 1ns/1ps
`include "mem_mux.v"

module mem_mux_tb;

    reg clk;
    reg [1:0]mem_to_reg;
    reg [31:0] alu_result;
    reg [31:0] mem_data;
    reg [31:0]pc;
    wire [31:0] out;

    mem_mux uut (clk,mem_to_reg,alu_result,mem_data,pc,out);


always#1clk=~clk;
initial begin
    $dumpfile("mem_mux.vcd");
    $dumpvars(0,mem_mux_tb);

    clk=0;mem_data=20;alu_result=15;pc=4;#3;

    mem_to_reg=0;#2;
    mem_to_reg=1;#2;
    mem_to_reg=2;#2;
    mem_to_reg=3;#2;

    $finish;
end
endmodule