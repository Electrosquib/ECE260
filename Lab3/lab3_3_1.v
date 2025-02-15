`timescale 1ns/1ps

module lab3_3_1(
    input [1:0] a,
    input [1:0] b,
    output lt,
    output gt,
    output eq
);
// reg [2:0] ROM [15:0];
// assign {lt, gt, eq} = ROM[{b, a}];
// initial $readmemb ("ROM_data.txt", ROM, 0, 15);

assign {gt, lt, eq} = (a == 2'b00 && b == 2'b00) ? 3'b001 :
                      (a == 2'b00 && b == 2'b01) ? 3'b010 :
                      (a == 2'b00 && b == 2'b10) ? 3'b010 :
                      (a == 2'b00 && b == 2'b11) ? 3'b010 :
                      (a == 2'b01 && b == 2'b00) ? 3'b100 :
                      (a == 2'b01 && b == 2'b01) ? 3'b001 :
                      (a == 2'b01 && b == 2'b10) ? 3'b010 :
                      (a == 2'b01 && b == 2'b11) ? 3'b010 :
                      (a == 2'b10 && b == 2'b00) ? 3'b100 :
                      (a == 2'b10 && b == 2'b01) ? 3'b100 :
                      (a == 2'b10 && b == 2'b10) ? 3'b001 :
                      (a == 2'b10 && b == 2'b11) ? 3'b010 :
                      (a == 2'b11 && b == 2'b00) ? 3'b100 :
                      (a == 2'b11 && b == 2'b01) ? 3'b100 :
                      (a == 2'b11 && b == 2'b10) ? 3'b100 :
                      (a == 2'b11 && b == 2'b11) ? 3'b001 :
                      3'b001;

endmodule