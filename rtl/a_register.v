module a_register (
input wire clk,
input wire reset,
input wire [7:0] bus_in,
output wire [7:0] bus_out,
input wire AI,
input wire AO,
output reg [7:0] a_out
);

always @(posedge clk or posedge reset)
begin
if (reset)
a_out <= 8'b00000000;
else if (AI)
a_out <= bus_in;
end

assign bus_out = AO ? a_out : 8'b00000000;

endmodule

