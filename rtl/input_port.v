module input_port (
input wire INI,
input wire [7:0] data_in,
output wire [7:0] bus_out
);

assign bus_out = INI ? data_in : 8'b00000000;

endmodule

