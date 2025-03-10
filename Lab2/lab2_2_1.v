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

module lab2_2_1(
    input [3:0] v,
    output z,
    output [3:0] an,
    output [6:0] seg
);
    wire comp_result;
    wire [0:3] add6;
    wire [0:3] carry;
    wire [0:3] res;

    assign an = 4'b1110;

    comparator comp1(v, comp_result);
    assign z = comp_result;
    
    adder ad1 (v[0], 1'b0, 1'b0, add6[0], carry[0]);
    adder ad2 (v[1], 1'b1, carry[0], add6[1], carry[1]);
    adder ad3 (v[2], 1'b1, carry[1], add6[2], carry[2]);
    adder ad4 (v[3], 1'b0, carry[2], add6[3], carry[3]);
    
    
    assign res[0] = (~comp_result & v[0]) | (comp_result & add6[0]);
  	assign res[1] = (~comp_result & v[1]) | (comp_result & add6[1]);
    assign res[2] = (~comp_result & v[2]) | (comp_result & add6[2]);
    assign res[3] = (~comp_result & v[3]) | (comp_result & add6[3]);

    sevseg s1 (res, seg);

endmodule


module adder(
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

module comparator(
    input [0:3] x,
    output out
);
    assign out = ~(~x[0] | (x[0] & ~x[1] & ~x[2]));
    
endmodule


module sevseg(
    input [0:3] x,
    output reg [6:0] seg
    );
    
    always @(*)
    begin
    
    case (x)
    4'b0000: seg = 7'b0000001;
    4'b1000: seg = 7'b1001111;
    4'b0100: seg = 7'b0010010;
    4'b1100: seg = 7'b0000110;
    4'b0010: seg = 7'b1001100;
    4'b1010: seg = 7'b0100100;
    4'b0110: seg = 7'b0100000;
    4'b1110: seg = 7'b0001111;
    4'b0001: seg = 7'b0000000;
    4'b1001: seg = 7'b0000100;
    4'b0101: seg = 7'b0000001;
    4'b1101: seg = 7'b1100000;
    4'b0011: seg = 7'b0110001;
    4'b1011: seg = 7'b1000010;
    4'b0111: seg = 7'b0110000;
    4'b1111: seg = 7'b0111000;


     endcase    
  end
endmodule

