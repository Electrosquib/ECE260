`timescale 1ns/1ps

module lab8_1_1 (
    input clk,
    input reset,
    input enable,
    output reg Q,
    output reg locked
);
    parameter DIV_FACTOR = 5000000; 

    reg [22:0] counter = 0;
    initial begin
        Q = 0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            Q <= 0;
            counter <= 0;
            locked <= 1;
        end else if (enable) begin
            locked <= 0;
        end else begin
            locked <= 1;
        if (counter == DIV_FACTOR - 1) begin
            Q <= ~Q;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
        end
    end

endmodule