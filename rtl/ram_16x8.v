`timescale 1ns / 1ps

module ram16x8(
input clk,ri,ro,
input [3:0]addr,
inout [7:0]bus);

reg [7:0]ram [15:0];
initial begin
$readmemb("rram.mem",ram);
end
always@(posedge clk)
begin
if(ri)
ram[addr] <= bus;
end
assign bus = ro ? ram[addr] : 8'bz;

endmodule
