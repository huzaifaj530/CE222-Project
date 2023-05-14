module instruction_memory(clk,read_addr,instruction);
input clk;
input [9:0] read_addr;
output reg [31:0] instruction;
reg [31:0] imemory [1023:0];


always@(*)
begin
	//fill with instructions
    imemory[0] = 32'b00000000001000001000000010110011;   // add x1 x1 x2
    imemory[1] = 32'b01000000001100010000000100110011;   // sub x2 x2 x3
    imemory[2] = 32'b00000000000100100111001000110011;   // and x4 x4 x1
    imemory[3] = 32'b00000000010100011110000110110011;   // or x3 x3 x5
    imemory[4] = 32'b00000000110000010000001000010011;   // addi x4 x2 12
    imemory[5] = 32'b00000001011100000010000110000011;   // lw x3 23(x0)
    imemory[6] = 32'b00000000010100011000000110000011;   // lb x5 5(x3)
    imemory[7] = 32'b00000000010100011010001010100011;   // sw x5 5(x3)
    imemory[8] = 32'b00000000001000001000110100100011;   // sb x6 90(x1)
    imemory[9] = 32'b00000001000000010000001001100011;   // beq x4 x2 4
	instruction=imemory[read_addr];
end

endmodule