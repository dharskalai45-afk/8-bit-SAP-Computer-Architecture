module clock_divider (
input wire clk_in,
input wire reset,
output reg clk_out,
output wire tick
);

parameter HALF_PERIOD = 28'b1110111001101011001010000000;

reg [27:0] count;

assign tick = (count == HALF_PERIOD - 28'b1) & ~clk_out & ~reset;

always @(posedge clk_in or posedge reset)
begin
if (reset)
begin
count <= 28'b0;
clk_out <= 1'b0;
end

else if (count == HALF_PERIOD - 28'b1)
begin
count <= 28'b0;
clk_out <= ~clk_out;
end

else
count <= count + 28'b1;
end

endmodule
