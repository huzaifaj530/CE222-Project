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

module processor(clk,reset,instr,pc_out,imm_out,alu_control,reg_out1,reg_out2,alu_result,flag,read_data);

//inputs
input clk,reset;
output [31:0] instr;
output [9:0]pc_out;
output [20:0]imm_out;
output [2:0]alu_control;
output [31:0]reg_out1;
output [31:0]reg_out2;
output [31:0]alu_result;
output flag;
output [31:0]read_data;

assign instr=instruction;
assign pc_out=pc;
assign imm_out=imm;
assign alu_control=alu_op;
assign reg_out1=out1;
assign reg_out2=out2;
assign alu_result=result;
assign read_data=data_out;
assign flag=zero_flag;

wire [9:0] pc;
ProgramCounter PC1 (clk,reset,imm,branch,out1,mem_to_reg,zero_flag,pc);

// instruction memory output-> decoder input
wire [31:0]instruction;

instruction_memory INSTRUCTION_MEMORY(clk,pc,instruction);

//decoder outputs ->regile,control,alu_control.
wire [2:0]func3;
wire [6:0]func7;
wire [6:0]opcode;
wire [4:0]r1;
wire [4:0]r2;
wire [4:0]rd;
wire [20:0]imm;
wire size;

decoder DECODER (clk,instruction,func3,func7,opcode,r1,r2,rd,imm,size);

//control outputs

wire mem_read;
wire mem_write;
wire alu_src;
wire reg_write;
wire [1:0] mem_to_reg;

control CONTROL (alu_src,branch,mem_read,mem_to_reg,reg_write,mem_write,opcode,clk);

//alu control
wire [2:0]alu_op;
alu_control ALU_C(clk,func3,func7,opcode,alu_op);


//regfile output
wire [31:0] out1;
wire [31:0] out2;

reg_file REG_FILE(clk,reg_write,r1,r2,rd,write_data,out1,out2);


//mux alu src
wire [31:0]selected;
alu_mux ALU_MUX(clk,alu_src,out2,imm,selected);

//alu outputs
wire zero_flag;
wire [31:0]result;

alu ALU(clk,out1,selected,result,alu_op,zero_flag);

//data memory 
wire [31:0] data_out;
data_memory DATA_MEMORY(data_out,size,clk,result,out2,mem_read,mem_write);

//mem to reg mux
wire[31:0]write_data;
mem_mux MEM_MUX(clk,mem_to_reg,result,data_out,pc,write_data);


endmodule