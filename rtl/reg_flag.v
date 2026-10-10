`timescale 1ns / 1ps

module reg_flag (
    output reg flag_C,
    output reg flag_Z,
    input clk,
    input rst,
    input carry,
    input zero,
    input fe
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            flag_C <= 1'b0;
            flag_Z <= 1'b0;
        end
        else if (fe) begin
            flag_C <= carry;
            flag_Z <= zero;
        end
    end
