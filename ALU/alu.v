`timescale 1ns / 1ps


module alu(clk,a,b,out,alu_control,zero_flag);//s is ALU CONTROL
input clk;
input [31:0] a,b;
input [2:0] alu_control;
output reg zero_flag;
output reg [31:0] out;

always@(posedge clk)
begin
	case(alu_control)
	3'b000:
		out=a&b;
	3'b001:
		out=a|b;	
	3'b010:
		out=a+b;
	3'b011:
		out=a-b;
	3'b100:
    begin
        if(a<b)
            out=0;
        else 
            out=1; 
    end
	3'b101:
	 begin
        if(a>=b)
            out=0;
        else 
            out=1; 
    end
	3'b110:
	 begin
        if(a==b)
            out=0;
        else 
            out=1; 
    end
	endcase

    if(out==0)
        zero_flag=1;
    else
        zero_flag=0;
end 
endmodule