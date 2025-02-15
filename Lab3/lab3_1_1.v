`timescale 1ns / 1ps

module lab3_1_1 (
    input [0:2] x,
    output [0:7] y
);
    assign y = (x == 3'b000) ? 8'b00000001 :
               (x == 3'b001) ? 8'b00010000 :
               (x == 3'b010) ? 8'b00000100 :
               (x == 3'b011) ? 8'b01000000 :
               (x == 3'b100) ? 8'b00000010 :
               (x == 3'b101) ? 8'b00100000 :
               (x == 3'b110) ? 8'b00001000 :
               (x == 3'b111) ? 8'b10000000 :
               8'b00000000;
endmodule