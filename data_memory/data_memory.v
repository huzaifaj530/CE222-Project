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


	//Temp data for debug
    memory[0]=8'h0;
    memory[1]=8'h0;
    memory[2]=8'h1;
    memory[3]=8'h0;//h0100 = 256

    memory[4]=8'h0;
    memory[5]=8'ha;
    memory[6]=8'h0;
    memory[7]=8'h1;//h10a0 = 4256

    memory[8]=8'h0;
    memory[9]=8'h7;
    memory[10]=8'h2;
    memory[11]=8'h3;//h3270 = 12912

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