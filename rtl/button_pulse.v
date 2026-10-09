module button_pulse (
input wire clk,
input wire button,
output reg pulse
);

parameter LIMIT = 20'b11110100001001000000;

reg sync0;
reg sync1;
reg stable;
reg [19:0] count;

initial
begin
sync0 = 1'b0;
sync1 = 1'b0;
stable = 1'b0;
count = 20'b0;
pulse = 1'b0;
end

always @(posedge clk)
begin
sync0 <= button;
sync1 <= sync0;
pulse <= 1'b0;

if (sync1 == stable)
count <= 20'b0;
else
begin
count <= count + 20'b1;
if (count == LIMIT)
begin
stable <= sync1;
count <= 20'b0;
if (sync1)
pulse <= 1'b1;
end
end
end

endmodule

