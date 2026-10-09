module alu (
input wire [7:0] A,
input wire [7:0] B,
input wire SUB,
input wire XOR,
input wire AND,
input wire SFL,
input wire SFR,
input wire ALO,
output wire [7:0] ALU_out,
output reg flag_C,
output reg flag_Z
);

reg [7:0] result;

always @(*)
begin
result = 8'b00000000;
flag_C = 1'b0;

if (XOR)
begin
result = A ^ B;
end

else if (AND)
begin
result = A & B;
end

else if (SFL)
begin
{flag_C, result} = {A, 1'b0};
end

else if (SFR)
begin
{result, flag_C} = {1'b0, A};
end

else if (SUB)
begin
result = A - B;
if (A < B)
flag_C = 1'b1;
end

else
begin
{flag_C, result} = {1'b0, A} + {1'b0, B};
end

if (result == 8'b00000000)
flag_Z = 1'b1;
else
flag_Z = 1'b0;
end

assign ALU_out = ALO ? result : 8'b00000000;

endmodule

