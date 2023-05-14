`timescale 1ns / 1ps

module decoder(clk,instruction,func3,func7,opcode,r1,r2,rd,imm,size);

input clk;
input [31:0] instruction;// instruction 32 bit
output reg [2:0] func3;//func3 part
output reg [6:0] func7;// func7 part
output reg [6:0] opcode;//opcode part
output reg [4:0] r1,r2,rd;// address of r1,r2,rd
output reg [20:0] imm;//maximum imm can be 20 
output reg size; //size for lw or Lb

parameter r_type=7'b0110011;// add sub etc
parameter s_type=7'b0100011;//sw sb
parameter i_type=7'b0010011;// addi
parameter l_type=7'b0000011;//lw lb
parameter b_type=7'b1100011;//beq bge blt
parameter jal_type=7'b1101111;// jal
parameter jalr_type=7'b1100111;//jalr

always @(*) begin
    
    func3=3'bx;func7=7'bx;imm=0;r1=5'bx;r2=5'bx;rd=5'bx;// to remove garbage value
    opcode=instruction[6:0];
    size=1;//default size is word 
    case (opcode)
    r_type:
    begin
        rd=instruction[11:7];
        func3=instruction[14:12];
        r1=instruction[19:15];
        r2=instruction[24:20];
        func7=instruction[31:25];
    end
    s_type:
        begin
            imm[4:0]=instruction[11:7];
            func3=instruction[14:12];
            r1=instruction[19:15];
            r2=instruction[24:20];
            imm[11:5]=instruction[31:25];


            if(func3==3'b000)
                size=0;
        end
    i_type:
    begin
        rd=instruction[11:7];
        func3=instruction[14:12];
        r1=instruction[19:15];
        func7=7'bx;
        imm[11:0]=instruction[31:20];
    end
    l_type:
    begin
        rd=instruction[11:7];
        func3=instruction[14:12];
        r1=instruction[19:15];
        func7=7'bx;
        imm[11:0]=instruction[31:20];
        if(func3==3'b000)
                size=0;
    end
    b_type:// shifted right once
    begin
        
        imm[11]=instruction[7];
        imm[4:1]=instruction[11:8];
        func3=instruction[14:12];
        r1=instruction[19:15];
        r2=instruction[24:20];
        imm[10:5]=instruction[30:25];
        imm[12]=instruction[31];

        imm=imm>>>1;//signed right shift
        rd=5'bx;
        func7=7'bx;
    end
    jal_type:begin
        
        rd=instruction[11:7];
        imm[19:12]=instruction[19:12];
        imm[11]=instruction[20];
        imm[10:1]=instruction[30:21];
        imm[20]=instruction[31];

        imm=imm>>>1;//signed right shift
        func3=3'bx;
        r1=5'bx;
        r2=5'bx;
        func7=7'bx;
    end
    jalr_type:
    begin
        rd=instruction[11:7];
        func3=instruction[14:12];
        r1=instruction[19:15];
        func7=7'bx;
        imm[11:0]=instruction[31:20];
    end
    endcase
end
    
endmodule