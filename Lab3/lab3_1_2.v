`timescale 1ns / 1ps


module lab3_1_2 (
    input [0:5] x,
    input g1,
    input g2a_n,
    input g2b_n,
    output [0:7] y
);
assign y = (x == 6'b000000 && g1 & ~g2a_n & ~g2b_n) ? 8'b11111110 :
           (x == 6'b000001 && g1 & ~g2a_n & ~g2b_n) ? 8'b11111101 :
           (x == 6'b000010 && g1 & ~g2a_n & ~g2b_n) ? 8'b11111011 :
           (x == 6'b000011 && g1 & ~g2a_n & ~g2b_n) ? 8'b11110111 :
           (x == 6'b000100 && g1 & ~g2a_n & ~g2b_n) ? 8'b11101111 :
           (x == 6'b000101 && g1 & ~g2a_n & ~g2b_n) ? 8'b11011111 :
           (x == 6'b000110 && g1 & ~g2a_n & ~g2b_n) ? 8'b10111111 :
           (x == 6'b000111 && g1 & ~g2a_n & ~g2b_n) ? 8'b01111111 :

           8'b00000000;

endmodule