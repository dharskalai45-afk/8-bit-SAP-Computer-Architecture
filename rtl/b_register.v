module b_register (
input wire clk,
input wire reset,
input wire [7:0] bus_in,
input wire BI,
output reg [7:0] b_out
);

always @(posedge clk or posedge reset)
begin
if (reset)
b_out <= 8'b00000000;
else if (BI)
b_out <= bus_in;
end

endmodule

