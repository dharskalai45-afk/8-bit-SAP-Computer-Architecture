module reg_b (
    output [7:0] b_out,
    input clk,
    input rst,
    input [7:0] bus,
    input bi
);

    reg [7:0] breg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            breg <= 8'h00;
        else if (bi)
            breg <= bus;
    end

    assign b_out = breg;

endmodule
