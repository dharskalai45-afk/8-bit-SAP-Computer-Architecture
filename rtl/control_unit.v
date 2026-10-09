module control_unit(
output reg mi,ri,ro,ii,io,co,cl,ce,ai,ao,al,sub,xra,ana,fe,
bi,oi,alo,ini,sfli,sfri,hlti,
input [3:0]op_in,
input clk,rst,flag_C,flag_Z,start
);
parameter NOP = 4'b0000,
LDA = 4'b0001,
STA = 4'b0010,
ADD = 4'b0011,
SUB = 4'b0100,
AND = 4'b0101,
XOR = 4'b0110,
SFL = 4'b0111,
SFR = 4'b1000,
OUT = 4'b1001,
JMP = 4'b1010,
JZ = 4'b1011,
JC = 4'b1100,
IN = 4'b1101,
HLT = 4'b1110,
CMP = 4'b1111;

localparam IDL = 3'b000,
T1 = 3'b001,
T2 = 3'b010,
T3 = 3'b011,
T4 = 3'b100,
T5 = 3'b101,
T6 = 3'b110,
HALT = 3'b111;

reg [2:0] state,next_state;
always@(posedge clk or posedge rst)
begin
if (rst)
state <= IDL;
else
state <= next_state;
end
always @ (*)
begin
mi=1'b0;ri=1'b0;ro=1'b0;ii=1'b0;io=1'b0;co=1'b0;cl=1'b0;ce=1'b0;ai=1'b0;ao=1'b0;al=1'b0;sub=1'b0;xra=1'b0;ana=1'b0;fe=1'b0;bi=1'b0;oi=1'b0;alo=1'b0;ini=1'b0;sfli=1'b0;sfri=1'b0;hlti=1'b0;
next_state = state;
case(state)
IDL:
begin
end
T1:begin
co=1'b1;
mi=1'b1;
end
T2:begin
ro=1'b1;
ii=1'b1;
end
T3:begin
ce=1'b1;
end
T4: begin
case(op_in)
NOP : begin
end
LDA : begin
io = 1'b1;
mi = 1'b1;
end
STA : begin
io = 1'b1;
mi = 1'b1;
end
ADD : begin
io = 1'b1;
mi = 1'b1;
end
SUB : begin
io = 1'b1;
mi = 1'b1;
end
CMP : begin
io = 1'b1;
ai = 1'b1;
end
XOR : begin
io = 1'b1;
mi = 1'b1;
end
AND : begin
io = 1'b1;
mi = 1'b1;
end
JMP : begin
io = 1'b1;
cl = 1'b1;
end
JZ : begin
if(flag_Z)
begin
io = 1'b1;
cl = 1'b1;
end
end
JC : begin
if(flag_C)
begin
io = 1'b1;
cl = 1'b1;
end
end
IN: begin
ini = 1'b1;
ai = 1'b1;
end
OUT: begin
ao = 1'b1;
oi = 1'b1;
end
SFL: begin
sfli = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
SFR: begin
sfri = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
HLT : begin
hlti = 1'b1;
end
endcase
end

T5: begin
case(op_in)
LDA : begin
ro = 1'b1;
ai = 1'b1;
end
STA : begin
ao = 1'b1;
ri = 1'b1;
end
ADD : begin
ro = 1'b1;
bi = 1'b1;
end
SUB : begin
ro = 1'b1;
bi = 1'b1;
end
XOR : begin
ro = 1'b1;
bi = 1'b1;
end
AND : begin
ro = 1'b1;
bi = 1'b1;
end
CMP : begin
sub = 1'b1;
fe = 1'b1;
end
default : begin
end
endcase
end

T6: begin
case(op_in)
ADD : begin
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
SUB : begin
sub = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
XOR : begin
xra = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
AND : begin
ana = 1'b1;
alo = 1'b1;
ai = 1'b1;
fe = 1'b1;
end
default : begin
end
endcase
end

HALT: begin
hlti = 1'b1;
end

default: begin
end
endcase

case(state)
IDL : begin
if (start)
next_state = T1;
end
T1 : next_state = T2;
T2 : next_state = T3;
T3 : next_state = T4;
T4 : begin
case(op_in)
LDA, STA, ADD, SUB, XOR, AND, CMP : next_state = T5;
HLT : next_state = HALT;
default : next_state = T1;
endcase
end
T5 : begin
case(op_in)
ADD, SUB, XOR, AND : next_state = T6;
default : next_state = T1;
endcase
end
T6 : next_state = T1;
HALT : next_state = HALT;
default : next_state = IDL;
endcase

end
endmodule

