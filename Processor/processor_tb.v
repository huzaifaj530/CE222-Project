`timescale 1ns/1ps
`include "processor.v"

module processor_tb;

reg clk,reset;
wire [31:0]alu_result;

processor uut(clk,reset,alu_result);

always#1clk=~clk;
initial begin
    $dumpfile("proccessor.vcd");
    $dumpvars(0,processor_tb);

    clk=0;reset=1;#2;
    reset=0;

    #20;

    $finish;

end
    
endmodule
