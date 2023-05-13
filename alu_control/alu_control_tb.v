`timescale 1ns / 1ps
`include"alu_control.v"

module alu_control_tb;

    reg clk;
    reg [2:0] func3;
    reg [6:0] func7;
    reg [6:0]opcode;
    wire [2:0] alu_control;

    alu_control uut(clk,func3,func7,opcode,alu_control);

always#1clk=~clk;
initial begin
    $dumpfile("alu_control.vcd");
    $dumpvars(0,alu_control_tb);

        clk=0;#1;
        opcode=7'b0110011;#2;// add sub and or etc
        func3=3'b111;func7=7'b0;#2;//and
        func3=3'b110;func7=7'b0;#2;// or 
        func3=3'b000;func7=7'b0;#2;//add 
        func3=3'b000;func7=7'b0100000;#2;//sub


        opcode=7'b0100011;#2;//sw sb
        opcode=7'b0010011;#2;// addi
        opcode=7'b0000011;#2;//lw lb
        opcode=7'b1100011;//beq bge blt

        func3=3'b100;#2;//blt
        func3=3'b010;#2;//bge
        func3=3'b000;#2;//beq

        opcode=7'b1101111;#2;// jal
        opcode=7'b1100111;#2;//jalr

        $finish;
end
    
endmodule