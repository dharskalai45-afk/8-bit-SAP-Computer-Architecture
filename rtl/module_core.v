`timescale 1ns / 1ps

module core(out,SEG,AN,ext_inp,start,clk,rst);

input start,clk,rst;
input [7:0] ext_inp;
output [7:0]SEG,out;
output [3:0]AN;

wire [7:0]bus;
wire [7:0]a_out,b_out,alu_result;
wire [3:0]op_in,addr;
wire flag_C,flag_Z,carry,zero;
wire co,cl,ce,oi,bi,sub,alo,ao,ai,io,ii,ro,ri,mi,hlti,fe,rox,dna,ini,sfli,sfri,al;
wire sclk;

clk_div div1(
.rst(rst),
.clk_in(clk),
.clk_out(sclk)
);

PC pc1(
.bus(bus),
.clk(sclk),
.rst(rst),
.co(co),
.cl(cl),
.ce(ce)
);

mar mar1(
.addr(addr),
.clk(sclk),
.rst(rst),
.mi(mi),
.bus(bus)
);

ram16x8 ram1(
.bus(bus),
.addr(addr),
.clk(sclk),
.ri(ri),
.ro(ro)
);

instruction_reg ir1(
.opcode(op_in),
.bus(bus),
.clk(sclk),
.rst(rst),
.ii(ii),
.io(io)
);

reg_a a1(
.bus(bus),
.a_out(a_out),
.clk(sclk),
.rst(rst),
.ai(ai),
.ao(ao)
);

reg_b b1(
.b_out(b_out),
.clk(sclk),
.rst(rst),
.bus(bus),
.bi(bi)
);

alu alu1(
.res(alu_result),
.carry(carry),
.zero(zero),
.a(a_out),
.b(b_out),
.sub(sub),
.rox(rox),
.dna(dna),
.sfli(sfli),
.sfri(sfri)
);

assign bus = alo ? alu_result : 8'bz;

reg_flag flags1(
.flag_C(flag_C),
.flag_Z(flag_Z),
.clk(sclk),
.rst(rst),
.carry(carry),
.zero(zero),
.fe(fe)
);

reg_in inp1(
.bus(bus),
.ext_inp(ext_inp),
.inpi(ini)
);

reg_out out1(
.out(out),
.bus(bus),
.clk(sclk),
.rst(rst),
.oi(oi)
);

control_unit cu1(
.co(co),
.cl(cl),
.ce(ce),
.oi(oi),
.bi(bi),
.sub(sub),
.alo(alo),
.ao(ao),
.ai(ai),
.io(io),
.ii(ii),
.ro(ro),
.ri(ri),
.mi(mi),
.hlti(hlti),
.fe(fe),
.rox(rox),
.dna(dna),
.ini(ini),
.sfli(sfli),
.sfri(sfri),
.al(al),
.clk(sclk),
.rst(rst),
.op_in(op_in),
.flag_C(flag_C),
.flag_Z(flag_Z),
.start(start)
);

display_control disp(.clk(clk),
                 .rst(rst),
                 .data(out),
                 .AN(AN),
                 .SEG(SEG));
                 
endmodule
