`timescale 1ns/1ps

module lab3_3_2(
    input [0:1] a,
    input [0:1] b,
    output [0:3] prod

);
    reg [3:0] ROM [15:0];
    assign prod = ROM[{b, a}];
    initial $readmemb ("ROM_data.txt", ROM, 0, 15);

endmodule