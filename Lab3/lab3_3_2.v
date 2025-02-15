`timescale 1ns/1ps

module lab3_3_2(
    input [1:0] a,
    input [1:0] b,
    output [3:0] out
);

assign out = a * b;

endmodule
