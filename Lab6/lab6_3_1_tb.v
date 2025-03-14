`timescale 1ns/1ps

module lab6_3_1_tb;
    reg clk;
    reg reset;
    wire [2:0] count;
    wire [2:0] next_state;

    mealy_sequence_fsm uut (
        .clk(clk),
        .reset(reset),
        .count(count),
        .next_state(next_state)
    );

    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
        $display("count = %b | next_state = %b", count, next_state);
    end end

    initial begin
        reset = 1; #10;
        reset = 0; #10;
        #10;
    end
endmodule