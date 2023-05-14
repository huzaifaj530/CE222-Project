`timescale 1ns/1ps
`include "processor.v"

module processor_tb;

reg clk,reset;
wire [31:0]instr;
wire [9:0] pc_out;

processor uut(clk,reset,instr,pc_out);

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
