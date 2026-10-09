module instruction_register (
input wire clk,
input wire reset,
input wire [7:0] bus_in,
input wire II,
input wire IO,
output reg [7:0] ir_out,
output wire [3:0] opcode,
output wire [3:0] operand,
output wire [7:0] bus_out
);

always @(posedge clk or posedge reset)
begin
if (reset)
ir_out <= 8'b00000000;
else if (II)
ir_out <= bus_in;
end

assign opcode = ir_out[7:4];
assign operand = ir_out[3:0];
assign bus_out = IO ? {4'b0000, ir_out[3:0]} : 8'b00000000;

endmodule

