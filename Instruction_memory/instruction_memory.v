module instruction_memory(clk,read_addr,instruction);
input clk;
input [9:0] read_addr;
output reg [31:0] instruction;
reg [31:0] imemory [1023:0];


always@(posedge clk)
begin
	imemory[0] = 32'b00000000000100010000000010110011; // add x1 x1 x2
	imemory[1] = 32'b00000000000100010000000100110011; // add x2 x1 x2
	imemory[2] = 32'b00000000000100010000000110110011; // add x3 x1 x2
	imemory[3] = 32'b00000000000100010111001000110011; // and x4 x1 x2
	instruction=imemory[read_addr];
end

endmodule