module flag_register (
input wire clk,
input wire reset,
input wire flag_C_in,
input wire flag_Z_in,
input wire FE,
output reg flag_C,
output reg flag_Z
);

always @(posedge clk or posedge reset)
begin
if (reset)
begin
flag_C <= 1'b0;
flag_Z <= 1'b0;
end

else if (FE)
begin
flag_C <= flag_C_in;
flag_Z <= flag_Z_in;
end
end

endmodule
