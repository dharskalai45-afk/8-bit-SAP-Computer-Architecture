module output_register (
input wire clk,
input wire reset,
input wire [7:0] bus_in,
input wire OI,
output reg [7:0] output_data
);

always @(posedge clk or posedge reset)
begin
if (reset)
output_data <= 8'b00000000;
else if (OI)
output_data <= bus_in;
end

endmodule

