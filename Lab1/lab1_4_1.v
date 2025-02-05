`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 02:16:07 PM
// Design Name: 
// Module Name: lab1_4_1
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


module lab1_4_1(
    input u,
    input y,
    input w,
    input s0,
    input s1,
    output m
    );
    
    assign r1 = (u & ~s0) | (y & s0);
    
    assign m = (r1 & ~s1) | (w & s1);
    
endmodule
