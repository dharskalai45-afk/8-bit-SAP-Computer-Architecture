module main (
input wire clk,
input wire reset,
input wire start,
input wire prog_write,
input wire [3:0] prog_addr,
input wire [7:0] input_data,
output wire [7:0] output_data,
output wire running,
output wire halt
);

parameter DIV_HALF = 28'b1110111001101011001010000000;
parameter DEB_LIMIT = 20'b11110100001001000000;

wire cpu_reset;
wire clear;
wire slow_clk;
wire tick;
wire write_pulse;
wire start_pulse;
wire [7:0] bus;
wire [7:0] pc_bus, ram_bus, ir_bus, a_bus, alu_bus, in_bus;
wire [3:0] mar_addr;
wire [7:0] a_out, b_out, ir_out;
wire [3:0] opcode, operand;
wire [7:0] out_reg, ram_read;
wire flag_C_alu, flag_Z_alu, flag_C, flag_Z;
wire mi, ri, ro, ii, io, co, cl, ce, ai, ao, sub, xra, ana, fe, bi, oi, alo, ini, sfli, sfri, hlti;

assign cpu_reset = reset | clear;
assign halt = hlti;
assign output_data = running ? out_reg : ram_read;

data_bus u_bus (
.pc_in(pc_bus),
.ram_in(ram_bus),
.ir_in(ir_bus),
.a_in(a_bus),
.alu_in(alu_bus),
.port_in(in_bus),
.bus_out(bus)
);

button_pulse #(.LIMIT(DEB_LIMIT)) u_btn_write (
.clk(clk),
.button(prog_write),
.pulse(write_pulse)
);

button_pulse #(.LIMIT(DEB_LIMIT)) u_btn_start (
.clk(clk),
.button(start),
.pulse(start_pulse)
);

run_control u_run (
.clk(clk),
.reset(reset),
.start_pulse(start_pulse),
.clear(clear),
.running(running)
);

clock_divider #(.HALF_PERIOD(DIV_HALF)) u_clkdiv (
.clk_in(clk),
.reset(cpu_reset),
.clk_out(slow_clk),
.tick(tick)
);

control_unit u_cu (
.mi(mi), .ri(ri), .ro(ro), .ii(ii), .io(io), .co(co), .cl(cl), .ce(ce),
.ai(ai), .ao(ao), .al(), .sub(sub), .xra(xra), .ana(ana), .fe(fe),
.bi(bi), .oi(oi), .alo(alo), .ini(ini), .sfli(sfli), .sfri(sfri), .hlti(hlti),
.op_in(opcode),
.clk(slow_clk), .rst(cpu_reset), .flag_C(flag_C), .flag_Z(flag_Z),
.start(running)
);

program_counter u_pc (
.clk(slow_clk),
.reset(cpu_reset),
.CE(ce),
.CL(cl),
.CO(co),
.bus_in(bus),
.bus_out(pc_bus)
);

mar u_mar (
.clk(slow_clk),
.rst(cpu_reset),
.mi(mi),
.bus(bus),
.addr(mar_addr)
);

ram_16x8 u_ram (
.clk(clk),
.PROG(~running),
.PROG_WE(write_pulse),
.PROG_ADDR(prog_addr),
.PROG_DATA(input_data),
.TICK(tick),
.address(mar_addr),
.bus_in(bus),
.RI(ri),
.RO(ro),
.bus_out(ram_bus),
.read_data(ram_read)
);

instruction_register u_ir (
.clk(slow_clk),
.reset(cpu_reset),
.bus_in(bus),
.II(ii),
.IO(io),
.ir_out(ir_out),
.opcode(opcode),
.operand(operand),
.bus_out(ir_bus)
);

a_register u_a (
.clk(slow_clk),
.reset(cpu_reset),
.bus_in(bus),
.bus_out(a_bus),
.AI(ai),
.AO(ao),
.a_out(a_out)
);

b_register u_b (
.clk(slow_clk),
.reset(cpu_reset),
.bus_in(bus),
.BI(bi),
.b_out(b_out)
);

alu u_alu (
.A(a_out),
.B(b_out),
.SUB(sub),
.XOR(xra),
.AND(ana),
.SFL(sfli),
.SFR(sfri),
.ALO(alo),
.ALU_out(alu_bus),
.flag_C(flag_C_alu),
.flag_Z(flag_Z_alu)
);

flag_register u_flags (
.clk(slow_clk),
.reset(cpu_reset),
.flag_C_in(flag_C_alu),
.flag_Z_in(flag_Z_alu),
.FE(fe),
.flag_C(flag_C),
.flag_Z(flag_Z)
);

output_register u_out (
.clk(slow_clk),
.reset(cpu_reset),
.bus_in(bus),
.OI(oi),
.output_data(out_reg)
);

input_port u_in (
.INI(ini),
.data_in(input_data),
.bus_out(in_bus)
);

endmodule

