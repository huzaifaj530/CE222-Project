`timescale 1ns / 1ps

module control(alu_src,branch,mem_read,mem_to_reg,reg_write,mem_write,opcode, clk);
input clk;
input  [6:0] opcode;
output reg alu_src,branch,mem_read,reg_write,mem_write;
output reg [1:0]mem_to_reg;// for adding jal and jalr

parameter r_type=7'b0110011;// add sub etc
parameter s_type=7'b0100011;//sw sb
parameter i_type=7'b0010011;// addi
parameter l_type=7'b0000011;//lw lb
parameter b_type=7'b1100011;//beq bge blt
parameter jal_type=7'b1101111;// jal
parameter jalr_type=7'b1100111;//jalr

always@(*)begin
	case(opcode)
	r_type:begin
		alu_src=0;
		mem_to_reg=2'b00;
		reg_write=1;
		mem_read=0;
		mem_write=0;
		branch=0;
	end
	s_type:begin
		alu_src=1;
		mem_to_reg=2'bxx;
		reg_write=0;
		mem_read=0;
		mem_write=1;
		branch=0;
	end

    i_type:begin
		alu_src=1;
		mem_to_reg=2'b00;
		reg_write=1;
		mem_read=0;
		mem_write=0;
		branch=0;
	end


	l_type:begin
		alu_src=1;
		mem_to_reg=2'b01;
		reg_write=1;
		mem_read=1;
		mem_write=0;
		branch=0;
	end
	
	b_type:begin
		alu_src=0;
		mem_to_reg=2'bxx;
		reg_write=0;
		mem_read=0;
		mem_write=0;
		branch=1;
	end
    jal_type:
    begin
        alu_src=0;
		mem_to_reg=2'b10;
		reg_write=1;
		mem_read=0;
		mem_write=0;
		branch=1;
    end
    jalr_type:
    begin
        alu_src=1;
		mem_to_reg=2'b11;
		reg_write=1;
		mem_read=0;
		mem_write=0;
		branch=1;
    end

	endcase
end

endmodule