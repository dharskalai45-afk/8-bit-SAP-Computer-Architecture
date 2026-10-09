module run_control (
input wire clk,
input wire reset,
input wire start_pulse,
output reg clear,
output reg running
);

localparam S_IDLE = 2'b00,
S_CLEAR = 2'b01,
S_RUN = 2'b10;

reg [1:0] state;
reg [1:0] count;

always @(posedge clk or posedge reset)
begin
if (reset)
begin
state <= S_IDLE;
clear <= 1'b0;
running <= 1'b0;
count <= 2'b00;
end

else
begin
case (state)
S_IDLE:
begin
if (start_pulse)
begin
clear <= 1'b1;
count <= 2'b00;
state <= S_CLEAR;
end
end

S_CLEAR:
begin
count <= count + 2'b01;
if (count == 2'b11)
begin
clear <= 1'b0;
running <= 1'b1;
state <= S_RUN;
end
end

S_RUN:
begin
end

default:
state <= S_IDLE;
endcase
end
end

endmodule
