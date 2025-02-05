`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 01:59:54 PM
// Design Name: 
// Module Name: lab1_3_2
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


module lab1_3_2(
    input s,
    input [0:1] x,
    input [0:1] y,
    output reg [0:1] m
    );
    
    always @ (*)
    begin
         if(s==1)
         begin
              m[0] = y[0];
              m[1] = y[1];
         end
         else
         begin
              m[0] = x[0];
              m[1] = x[1];
         end
    end

endmodule
