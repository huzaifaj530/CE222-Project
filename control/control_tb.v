`timescale 1ns / 1ps
`include"control.v"

module control_tb;
    
    reg clk;
    reg  [6:0] opcode;
    wire alu_src,branch,mem_read,reg_write,mem_write;
    wire [2:0]alu_op;
    wire [1:0]mem_to_reg;


    control uut(alu_src,branch,mem_read,mem_to_reg,reg_write,mem_write,alu_op,opcode, clk);

always#1clk=~clk;
    initial begin
        $dumpfile("control.vcd");
        $dumpvars(0,control_tb);
        clk=0;#1;
        opcode=7'b0110011;#2;// add sub etc
        opcode=7'b0100011;#2;//sw sb
        opcode=7'b0010011;#2;// addi
        opcode=7'b0000011;#2;//lw lb
        opcode=7'b1100011;#2;//beq bge blt
        opcode=7'b1101111;#2;// jal
        opcode=7'b1100111;#2;//jalr


        $finish;
    end
endmodule