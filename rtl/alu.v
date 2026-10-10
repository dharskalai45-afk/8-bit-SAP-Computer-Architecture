`timescale 1ns / 1ps

module alu (
    output reg [7:0] res,
    output reg carry,
    output reg zero,

    input [7:0] a,
    input [7:0] b,

    input sub,
    input rox,
    input dna,
    input sfli,
    input sfri
);

    reg [8:0] temp;

    always @(*) begin
        res   = 8'h00;
        carry = 1'b0;
        zero  = 1'b0;
        temp  = 9'h000;

        if (sub) begin
            res   = a - b;
            carry = (a < b);  // 1 means borrow
        end
        else if (rox) begin
            res = a ^ b;
        end
        else if (dna) begin
            res = a & b;
        end
        else if (sfli) begin
            res   = a << 1;
            carry = a[7];
        end
        else if (sfri) begin
            res   = a >> 1;
            carry = a[0];
        end
        else begin
            temp  = {1'b0, a} + {1'b0, b};
            res   = temp[7:0];
            carry = temp[8];
        end

        zero = (res == 8'h00);
    end

endmodule
