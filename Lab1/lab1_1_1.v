`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 08:44:32 AM
// Design Name: 
// Module Name: lab1_1_1
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


module lab1_1_1(
    input x,
    input y,
    input s,
    output m
    );
    wire s_out, a1_out, a2_out, or_out;
    not inv1 (s_out, s);
    and a1 (a1_out, x, s_out);
    and a2 (a2_out, s, y);
    or or1 (or_out, a1_out, a2_out);
    assign m = or_out;
    
endmodule
