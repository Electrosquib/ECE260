`timescale 1ns / 1ps


module lab4_1_1 (
    input [3:0] ain,
    input [3:0] bin,
    output reg cout,
    output reg [3:0] sum
);
    parameter MAXBITS = 4;
    task add;
        input [MAXBITS - 1:0] a;
        input [MAXBITS - 1:0] b;
        output [MAXBITS - 1:0] sum;
        output carry;

        assign {carry, sum} = a + b;
    endtask

    always @ (ain or bin)
        add(ain, bin, sum, cout);

endmodule