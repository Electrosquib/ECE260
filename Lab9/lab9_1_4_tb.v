`timescale 1ns / 1ps

module testbench;
    reg [3:0] bcd;
    reg enable;
    wire [3:0] out;

    lab9_1_2 dut (
        .bcd(bcd),
        .enable(enable),
        .out(out)
    );

    initial begin
        enable = 1'b1;

        bcd = 4'b0100;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 bcd = 4'b0110;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 bcd = 4'b0101;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 bcd = 4'b1100;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 bcd = 4'b0000;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 bcd = 4'b1111;
        $display("BCD: %b, GRAY: %b", bcd, out);

        #5 $finish;
    end

endmodule
