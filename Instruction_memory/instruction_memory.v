module instruction_memory(clk,read_addr,instruction);
input clk;
input [9:0] read_addr;
output reg [31:0] instruction;
reg [31:0] imemory [1023:0];


always@(*)
begin
	imemory[0] = 32'b00000000001000001000000010110011; // add x1 x1 x2
    imemory[1] = 32'b01000000001100010000000100110011; // sub x2 x2 x3
    imemory[2] = 32'b00000000010100011110000110110011; // or x3 x3 x5
    imemory[3] = 32'b00000000000100100111001000110011; // and x4 x4 x1
    imemory[4] = 32'b00000000010100011000000110000011; // lb x3 5(x5)
    imemory[5] = 32'b00000000010000010000001001100011; // beq x4 x2 1
	instruction=imemory[read_addr];
end

endmodule