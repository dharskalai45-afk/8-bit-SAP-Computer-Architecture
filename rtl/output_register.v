timescale 1ns / 1ps

module reg_out(
output [7:0]out,
input [7:0]bus,
input clk,rst,oi);

reg [7:0]o_reg;

always@(posedge clk or posedge rst)
begin
if(rst)
o_reg <= 8'b00000000;
else if(oi)
o_reg <= bus;
end

assign out = o_reg;

endmodule
