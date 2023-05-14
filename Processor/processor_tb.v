`timescale 1ns/1ps
`include "processor.v"

module processor_tb;

reg clk,reset;
wire [31:0]instr;
wire [9:0] pc_out;
wire [20:0]imm_out;
wire [2:0]alu_control;
wire [31:0]reg_out1;
wire [31:0]reg_out2;
wire [31:0]alu_result;

processor uut(clk,reset,instr,pc_out,imm_out,alu_control,reg_out1,reg_out2,alu_result);

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
