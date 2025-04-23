`timescale 1ns / 1ps

module three_by_three_bit_multiplier (
    input [2:0] multiplicand,
    input [2:0] multiplier,
    input start,
    input clk,
    output reg done,
    output reg [5:0] product
);
integer i = 0;
reg [5:0] ps = 6'b000000;
reg running = 0;

always @ (posedge clk) begin
    if (start && !running) begin
        running = 1;
        done = 0;
        product = 6'b000000;
    end
    else if (running && i < 3) begin
        if (multiplicand[i] == 1'b1) begin
            ps[2:0] = multiplier;
            ps = ps << i;
            product = product + ps;
            ps = 6'b000000;
        end
        i += 1;
    end
    else if (i >= 3) begin
        done = 1;
        running = 0;
        i = 0;
    end
end
endmodule