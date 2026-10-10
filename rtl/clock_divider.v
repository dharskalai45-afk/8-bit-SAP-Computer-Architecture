`timescale 1ns / 1ps

module clk_div #(
    parameter DIV = 8_333_333
)(
    input rst,
    input clk_in,
    output reg clk_out
);

    reg [25:0] count = 0;

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            count   <= 0;
            clk_out <= 0;
        end
        else if (count == DIV - 1) begin
            count   <= 0;
            clk_out <= ~clk_out;
        end
        else begin
            count <= count + 1;
        end
    end

endmodule
