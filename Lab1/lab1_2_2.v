`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 12:45:39 PM
// Design Name: 
// Module Name: lab1_2_2
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

module lab1_2_2(
    input [0:1] x,
    input [0:1] y,
    input s,
    output [0:1] m
    );
    assign #3 m[0] = (~s & x[0]) | (s & y[0]); // 3 units delay
    assign #3 m[1] = (~s & x[1]) | (s & y[1]); // 3 units delay

endmodule
