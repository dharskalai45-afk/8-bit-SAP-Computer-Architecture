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

   always @(*) begin
    res   = 8'h00;
    carry = 1'b0;
    zero  = 1'b0;

    if (sub) begin
        res   = a - b;
        carry = (a < b);
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
        res   = a + b;
        carry = (res < a);
    end

    zero = (res == 8'h00);
end

endmodule
