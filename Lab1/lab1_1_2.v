`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 10:13:07 AM
// Design Name: 
// Module Name: lab1_1_2
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


module lab1_1_2(
    input [0:1] x,
    input [0:1] y,
    input s,
    output [0:1] m
    );
    wire s_out, al_out, a2_out, or_out;
    not invl (s_out, s);
    not inv2 (s_out, s);

    and a11 (out11, s_out, x[0]);
    and a12 (out12, s_out, x[1]);

    and a21 (out21, s, y[0]);
    and a22 (out22, s, y[1]);

    or or1 (m[0], out11, out21);
    or or2 (m[1], out12, out22);
endmodule
