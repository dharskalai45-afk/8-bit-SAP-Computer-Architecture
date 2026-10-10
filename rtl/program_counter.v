`timescale 1ns / 1ps
module PC(
input clk,rst,co,cl,ce,
inout [7:0]bus);

reg [3:0]pc;
always@(posedge clk or posedge rst)
begin
if(rst)
    pc <= 4'b0000;
else if(cl)
    pc <= bus[3:0];
else if(ce)
    pc <= pc+1;
end    
assign bus = co ? {4'b0000,pc}:8'bz;
endmodule
