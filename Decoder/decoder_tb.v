`timescale 1ns / 1ps
`include "decoder.v"

module decoder_tb;

reg clk;
reg [31:0] instruction;// instruction 32 bit
wire [2:0] func3;//func3 part
wire [6:0] func7;// func7 part
wire [6:0] opcode;//opcode part
wire [4:0] r1,r2,rd;// address of r1,r2,rd
wire [20:0] imm;//maximum imm can be 20 

decoder uut(clk,instruction,func3,func7,opcode,r1,r2,rd,imm);
    
always#1clk=~clk;
initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder_tb);

    clk=0;#2;
        instruction = 32'b00000000001000001000000010110011;#10 // add x1 x1 x2
        instruction = 32'b00000000001000001000000011100011;#10 // beq x1 x2 2048
        instruction = 32'b00000000000010000000000011101111;#10 // jal x1 2048
    $finish;
end 
endmodule