`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 02:38:31 PM
// Design Name: 
// Module Name: lab1_4_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module lab2_2_2(
    input [3:0] x,
    output [0:4] y
    );

    wire a;
    wire b;
    wire c;
    wire d;

    assign a = x[0];
    assign b = x[1];
    assign c = x[2];
    assign d = x[3];
    
    // assign y[0] = ((a&~b&~c&~d) | (~a&b&c&d) | (~a&b&c&~d)) & ~((a&~b&~c&d) | (~a&b&~c&d) | (~a&b&~c&~d) | (~a&~b&c&d) | (~a&~b&c&~d) | (~a&~b&~c&~d) | (~a&~b&~c&d));
    // assign y[1] = ~(a&~b&~c&d) | (a&~b&~c&~d) | (~a&b&c&d) | (~a&b&c&~d) | ~(~a&b&~c&d) | ~(~a&b&~c&~d) | ~(~a&~b&c&d) | (~a&~b&c&~d) | (~a&~b&~c&~d) | (~a&~b&~c&d);
    // assign y[2] = (a&~b&~c&d) | ~(a&~b&~c&~d) | (~a&b&c&d) | (~a&b&c&~d) | ~(~a&b&~c&d) | (~a&b&~c&~d) | (~a&~b&c&d) | ~(~a&~b&c&~d) | (~a&~b&~c&~d) | ~(~a&~b&~c&d);
    // assign y[3] = (a&~b&~c&d) | (a&~b&~c&~d) | ~(~a&b&c&d) | (~a&b&c&~d) | (~a&b&~c&d) | ~(~a&b&~c&~d) | (~a&~b&c&d) | ~(~a&~b&c&~d) | ~(~a&~b&~c&~d) | (~a&~b&~c&d);
    // assign y[4] = (a&~b&~c&d) | (a&~b&~c&~d) | (~a&b&c&d) | ~(~a&b&c&~d) | (~a&b&~c&d) | (~a&b&~c&~d) | ~(~a&~b&c&d) | (~a&~b&c&~d) | ~(~a&~b&~c&~d) | ~(~a&~b&~c&d);
    
    wire [4:0] i;

    assign i = (x == 4'b0000) ? 5'b11000 :
               (x == 4'b0001) ? 5'b10100 :
               (x == 4'b0010) ? 5'b01100 :
               (x == 4'b0011) ? 5'b01001 :
               (x == 4'b0100) ? 5'b01010 :
               (x == 4'b0101) ? 5'b00110 :
               (x == 4'b0110) ? 5'b10001 :
               (x == 4'b0111) ? 5'b01001 :
               (x == 4'b1000) ? 5'b00101 :
               (x == 4'b1001) ? 5'b00011 :
               5'b00000;  
    assign y = {i[0], i[1], i[2], i[3], i[4]};


endmodule