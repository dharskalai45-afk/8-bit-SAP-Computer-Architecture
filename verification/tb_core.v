`timescale 1ns / 1ps

module core_tb;

    reg clk;
    reg rst;
    reg start;
    reg [7:0] ext_inp;

    wire [7:0] out;
    wire [7:0] SEG;
    wire [3:0] AN;

    integer output_count;
    integer pass_count;
    integer fail_count;
    integer i;
    integer cycles;

    reg [7:0] expected [0:13];

    core dut (
        .out(out),
        .SEG(SEG),
        .AN(AN),
        .ext_inp(ext_inp),
        .start(start),
        .clk(clk),
        .rst(rst)
    );

    // 100 MHz simulation clock.
    always #5 clk = ~clk;

    initial begin
        expected[0]  = 8'd0;
        expected[1]  = 8'd1;
        expected[2]  = 8'd1;
        expected[3]  = 8'd2;
        expected[4]  = 8'd3;
        expected[5]  = 8'd5;
        expected[6]  = 8'd8;
        expected[7]  = 8'd13;
        expected[8]  = 8'd21;
        expected[9]  = 8'd34;
        expected[10] = 8'd55;
        expected[11] = 8'd89;
        expected[12] = 8'd144;
        expected[13] = 8'd233;
    end

    initial begin
        clk          = 1'b0;
        rst          = 1'b1;
        start        = 1'b0;
        ext_inp      = 8'd0;
        output_count = 0;
        pass_count   = 0;
        fail_count   = 0;
        cycles       = 0;

        // Bypass the clock divider for faster simulation.
        force dut.sclk = clk;

        // IMPORTANT:
        // The RAM module itself must load rram.mem using
        // $readmemb("rram.mem", <your_RAM_array_name>);
        // Do not reference dut.ram1.mem here unless the
        // actual array inside ram16x8 is named "mem".

        $display("");
        $display("==============================================");
        $display("       8-BIT CPU FIBONACCI TEST");
        $display("==============================================");

        repeat (5) @(negedge clk);
        rst = 1'b0;

        repeat (2) @(negedge clk);
        start = 1'b1;

        // Wait for 14 outputs or for the CPU to halt.
        while ((output_count < 14) &&
               (cycles < 20000)) begin
            @(negedge clk);
            cycles = cycles + 1;

            // Capture each OUT instruction once.
            if (dut.oi === 1'b1) begin
                #1;

                if (output_count < 14) begin
                    $display("");
                    $display("[OUT #%0d]", output_count + 1);
                    $display("Time     : %0t", $time);
                    $display("Decimal  : %0d", out);
                    $display("Hex      : %02h", out);
                    $display("Binary   : %08b", out);
                    $display("Expected : %0d",
                             expected[output_count]);

                    if (out === expected[output_count]) begin
                        $display("CHECK    : PASS");
                        pass_count = pass_count + 1;
                    end
                    else begin
                        $display("CHECK    : FAIL");
                        fail_count = fail_count + 1;
                    end

                    output_count = output_count + 1;

                    // Avoid counting the same OUT state twice.
                    @(posedge clk);
                end
            end

            // Detailed internal debug information.
            $display(
                "[DEBUG] T=%0t | MAR=%h | OPCODE=%h | BUS=%h | A=%h | B=%h | ALU=%h | C=%b | Z=%b | STATE=%h | OUT=%h | HALT=%b",
                $time,
                dut.addr,
                dut.op_in,
                dut.bus,
                dut.a_out,
                dut.b_out,
                dut.alu_result,
                dut.flag_C,
                dut.flag_Z,
                dut.cu1.state,
                out,
                dut.hlti
            );

            // HLT should be reached after carry is detected.
            if (dut.hlti === 1'b1 &&
                output_count == 14) begin
                cycles = 20000;
            end
        end

        start = 1'b0;

        $display("");
        $display("==============================================");
        $display("                TEST SUMMARY");
        $display("==============================================");
        $display("Outputs captured : %0d", output_count);
        $display("PASS             : %0d", pass_count);
        $display("FAIL             : %0d", fail_count);
        $display("Final out (DEC)  : %0d", out);
        $display("Final out (HEX)  : %02h", out);
        $display("==============================================");

        if (output_count == 14 && fail_count == 0)
            $display("RESULT: ALL 14 OUTPUTS PASSED");
        else if (output_count < 14)
            $display("RESULT: INCOMPLETE - CHECK RAM, LOOP AND CARRY");
        else
            $display("RESULT: FAILED - CHECK DEBUG LOG");

        $finish;
    end

endmodule
