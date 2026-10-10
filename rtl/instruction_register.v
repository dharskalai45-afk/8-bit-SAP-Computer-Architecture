`timescale 1ns / 1ps

module instruction_reg(
input clk,rst,ii,io,
inout [7:0]bus,
output [3:0]opcode);

reg [7:0]ir;

always@(posedge clk or posedge rst)
begin
if(rst)
ir <= 8'b00000000;
else if(ii)
ir <= bus;
end

assign opcode = ir[7:4];
assign bus = io ? {4'b0000,ir[3:0]}:8'bz;

endmodule
