module control_unit(
output reg mi,ri,ro,ii,io,co,cl,ce,ai,ao,al,sub,rox,dna,fe,
output reg bi,oi,alo,ini,sfli,sfri,hlti,
input [3:0]op_in,
input clk,rst,flag_C,flag_Z,start
);

parameter NOP = 4'd0,
LDA = 4'd1,
STA = 4'd2,
ADD = 4'd3,
SUB = 4'd4,
AND = 4'd5,
XOR = 4'd6,
SFL = 4'd7,
SFR = 4'd8,
OUT = 4'd9,
JMP = 4'd10,
JZ = 4'd11,
JC = 4'd12,
IN = 4'd13,
HLT = 4'd14,
CMP = 4'd15;

localparam IDL = 3'd0,
T1 = 3'd1,
T2 = 3'd2,
T3 = 3'd3,
T4 = 3'd4,
T5 = 3'd5,
T6 = 3'd6,
HALT = 3'd7;

reg [2:0]state,next_state;

always@(posedge clk or posedge rst)
begin
if(rst)
state <= IDL;
else
state <= next_state;
end
always@(*)
begin
mi = 1'b0;
ri = 1'b0;
ro = 1'b0;
ii = 1'b0;
io = 1'b0;
co = 1'b0;
cl = 1'b0;
ce = 1'b0;
ai = 1'b0;
ao = 1'b0;
al = 1'b0;
sub = 1'b0;
rox = 1'b0;
dna = 1'b0;
fe = 1'b0;
bi = 1'b0;
oi = 1'b0;
alo = 1'b0;
ini = 1'b0;
sfli = 1'b0;
sfri = 1'b0;
hlti = 1'b0;
next_state = state;

case(state)

IDL:
begin
if(start)
next_state = T1;
else
next_state = IDL;
end

T1:
begin
co = 1'b1;
mi = 1'b1;
next_state = T2;
end

T2:
begin
ro = 1'b1;
ii = 1'b1;
next_state = T3;
end

T3:
begin
ce = 1'b1;
next_state = T4;
end

T4:
begin
case(op_in)

NOP:
begin
next_state = T1;
end

LDA,STA,ADD,SUB,XOR,AND,CMP:
begin
io = 1'b1;
mi = 1'b1;
next_state = T5;
end

JMP:
begin
io = 1'b1;
cl = 1'b1;
next_state = T1;
end

JZ:
begin
if(flag_Z)
begin
io = 1'b1;
cl = 1'b1;
end
next_state = T1;
end

JC:
begin
if(flag_C)
begin
io = 1'b1;
cl = 1'b1;
end
next_state = T1;
end

IN:
begin
ini = 1'b1;
ai = 1'b1;
next_state = T1;
end

OUT:
begin
ao = 1'b1;
oi = 1'b1;
next_state = T1;
end

SFL:
begin
sfli = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
next_state = T1;
end

SFR:
begin
sfri = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
next_state = T1;
end

HLT:
begin
hlti = 1'b1;
next_state = HALT;
end

default:
begin
next_state = T1;
end

endcase
end

T5:
begin
case(op_in)

LDA:
begin
ro = 1'b1;
ai = 1'b1;
next_state = T1;
end

STA:
begin
ao = 1'b1;
ri = 1'b1;
next_state = T1;
end

ADD,SUB,XOR,AND,CMP:
begin
ro = 1'b1;
bi = 1'b1;
next_state = T6;
end

default:
begin
next_state = T1;
end

endcase
end

T6:
begin
case(op_in)

ADD:
begin
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end

SUB:
begin
sub = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end

XOR:
begin
rox = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end

AND:
begin
dna = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end

CMP:
begin
sub = 1'b1;
fe = 1'b1;
end

default:
begin
end

endcase
next_state = T1;
end

HALT:
begin
hlti = 1'b1;
next_state = HALT;
end

default:
begin
next_state = IDL;
end

endcase
end

endmodule
