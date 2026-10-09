module mar(
input clk,
input rst,
input mi,
input [7:0] bus,
output reg [3:0] addr
);

always @(posedge clk or posedge rst)
begin
if (rst)
addr <= 4'b0000;
else if (mi)
addr <= bus[3:0];
end

endmodule

