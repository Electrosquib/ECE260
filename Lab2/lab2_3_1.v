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

module lab2_3_1(
    input a,
    input b,
    input cin,
    output s,
    output cout
);
    wire [0:3] carry;
    
    adder1 ad1 (a, b, cin, s, cout);
    // adder ad2 (a[1], b[1], carry[0], s[1], carry[1]);
    // adder ad3 (a[2], b[2], carry[1], s[2], carry[2]);
    // adder ad4 (a[3], b[3], carry[2], s[3], cout);

endmodule


module adder1(
    input a,
    input b,
    input cin,
    output s,
    output cout
);
    wire xor1;
    assign xor1 = (a ^ b);
    assign s = (xor1) ^ cin;
    assign cout = (a & b) | (xor1 & cin);
    
endmodule