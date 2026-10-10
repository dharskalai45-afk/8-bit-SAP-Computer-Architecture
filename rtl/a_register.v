`timescale 1ns / 1ps

module reg_a(
    input clk,
    input rst,
    input ai,
    input ao,
    inout [7:0] bus,
    output [7:0] a_out
);

reg [7:0] areg;

always @(posedge clk or posedge rst) begin
    if (rst)
        areg <= 8'b00000000;
    else if (ai)
        areg <= bus;
end

assign bus = ao ? areg : 8'bz;
assign a_out = areg;

endmodule
