`timescale 1ns / 1ps

module reg_in(
input inpi,
input [7:0]ext_inp,
inout [7:0]bus);

assign bus = inpi ? ext_inp : 8'bz;

endmodule
