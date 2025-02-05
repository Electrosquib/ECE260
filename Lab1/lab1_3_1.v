`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 01:50:21 PM
// Design Name: 
// Module Name: lab1_3_1
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


module lab1_3_1(
    input x,
    input s,
    input y,
    output reg m
    );
    
    always @ (x or y or s)
    
    begin
    
         if(s==0)
    
              m=x;
    
         else
    
              m=y;
    
    end
endmodule
