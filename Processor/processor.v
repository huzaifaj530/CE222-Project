`timescale 1ns/1ps

`include "../ALU/alu.v"
`include "../alu_control/alu_control.v"
`include "../alu_src_mux/alu_mux.v"
`include "../control/control.v"
`include "../data_memory/data_memory.v"
`include "../decoder/decoder.v"
`include "../Instruction_memory/instruction_memory.v"
`include "../mem_to_reg_mux/mem_mux.v"
`include "../ProgramCounter/ProgramCounter.v"
`include "../reg_file/reg_file.v"

// module alu(clk,a,b,out,alu_control,zero_flag);//s is ALU CONTROL
// module alu_control(clk,func3,func7,opcode,alu_control);
// module alu_mux (clk,alu_src,reg2,imm,out);
// module control(alu_src,branch,mem_read,mem_to_reg,reg_write,mem_write,alu_op,opcode, clk);
// module data_memory(read_data,clk,address,write_data,mem_rd,mem_wr);
// module decoder(clk,instruction,func3,func7,opcode,r1,r2,rd,imm);
// module instruction_memory(clk,read_addr,instruction);
// module mem_mux(clk,mem_to_reg,alu_result,mem_data,pc,out);
// module ProgramCounter(input clk,reset,input [20:0]offset,input branch,input [31:0]reg_out1,input [1:0]mem_to_reg,output reg [9:0] count
// );
// module reg_file (
// input clk,wr,
// input [4:0] r1,r2,rd, //5bit reg address of  the 3 registers for R-type
// input [31:0] write_data,// data written into destination register
// output reg [31:0] out1,out2// 
// );

module processor();
input clk,reset;
input zero_flag;
input branch;
input [1:0] mem_to_reg;
input [20:0] immediate;
input [31:0]reg_out1;





    
endmodule