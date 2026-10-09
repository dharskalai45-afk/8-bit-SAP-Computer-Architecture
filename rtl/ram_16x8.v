module ram_16x8 (
input wire clk,
input wire PROG,
input wire PROG_WE,
input wire [3:0] PROG_ADDR,
input wire [7:0] PROG_DATA,
input wire TICK,
input wire [3:0] address,
input wire [7:0] bus_in,
input wire RI,
input wire RO,
output wire [7:0] bus_out,
output wire [7:0] read_data
);

reg [7:0] memory [0:15];

integer i;

initial
begin
for (i = 32'b0; i < 32'b10000; i = i + 32'b1)
memory[i] = 8'b00000000;
end

wire [3:0] addr_sel;
wire [7:0] data_sel;
wire we;

assign addr_sel = PROG ? PROG_ADDR : address;
assign data_sel = PROG ? PROG_DATA : bus_in;
assign we = PROG ? PROG_WE : (RI & TICK);

always @(posedge clk)
begin
if (we)
memory[addr_sel] <= data_sel;
end

assign read_data = memory[addr_sel];
assign bus_out = RO ? memory[addr_sel] : 8'b00000000;

endmodule

