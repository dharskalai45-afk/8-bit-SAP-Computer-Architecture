module program_counter (
input wire clk,
input wire reset,
input wire CE,
input wire CL,
input wire CO,
input wire [7:0] bus_in,
output wire [7:0] bus_out
);

reg [3:0] count;

always @(posedge clk or posedge reset)
begin
if (reset)
count <= 4'b0000;
else if (CL)
count <= bus_in[3:0];
else if (CE)
count <= count + 4'b0001;
end

assign bus_out = CO ? {4'b0000, count} : 8'b00000000;

endmodule

