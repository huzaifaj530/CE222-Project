`timescale 1ns / 1ps

module data_memory(read_data,size,clk,address,write_data,mem_rd,mem_wr);
input clk;
input size;
input [31:0] address;
input [31:0] write_data;
input mem_rd;
input mem_wr;

reg [7:0] memory[1023:0];// 1023 locations of 4 bytes == 1024 bytes totals.
output reg [31:0] read_data;

always@(*)begin


	memory[0]=8'h02;
	memory[1]=8'h02;
	memory[2]=8'h02;
	memory[3]=8'h02;

	memory[4]=9;
	memory[5]=7;
	memory[6]=2;
	memory[7]=6;

	memory[10]=99;

	case(size)
	0:begin
	if(mem_rd==1)
		read_data=memory[address];
	if(mem_wr==1)
		memory[address]=write_data;
	end
	1:
	begin
		if(mem_rd==1)
		begin
		read_data[7:0]=memory[address];
		read_data[15:8]=memory[address+1];
		read_data[23:16]=memory[address+2];
		read_data[31:24]=memory[address+3];
		end
		if(mem_wr==1)
		begin
		memory[address]=write_data[7:0];
		memory[address+1]=write_data[15:8];
		memory[address+2]=write_data[23:16];
		memory[address+3]=write_data[31:24];
		end
	end
	endcase
end

endmodule