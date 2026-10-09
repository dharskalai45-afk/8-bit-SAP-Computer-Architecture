module data_bus (
input wire [7:0] pc_in,
input wire [7:0] ram_in,
input wire [7:0] ir_in,
input wire [7:0] a_in,
input wire [7:0] alu_in,
input wire [7:0] port_in,
output wire [7:0] bus_out
);

assign bus_out = pc_in | ram_in | ir_in | a_in | alu_in | port_in;

endmodule

