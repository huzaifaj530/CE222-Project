module instruction_memory(clk,read_addr,instruction);
input clk;
input [31:0] read_addr;
output reg [31:0] instruction;
reg [31:0] imemory [1023:0];


always@(posedge clk)
begin
	imemory[0]=32'b00000000000100010000000010110011; // add x1 x1 x2

	instruction=imemory[read_addr];
end

endmodule