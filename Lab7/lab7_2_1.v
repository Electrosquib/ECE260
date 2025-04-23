`timescale 1ns/1ps

module lab7_2_1(input clk, input clear_n, input enable, output [7:0] Q);
    tff t0(clk, enable, clear_n, Q[0]);
    tff t1(clk, enable & Q[0], clear_n, Q[1]);
    tff t2(clk, enable & Q[0] & Q[1], clear_n, Q[2]);
    tff t3(clk, enable & Q[0] & Q[1] & Q[2], clear_n, Q[3]);
    tff t4(clk, enable & Q[0] & Q[1] & Q[2] & Q[3], clear_n, Q[4]);
    tff t5(clk, enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4], clear_n, Q[5]);
    tff t6(clk, enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5], clear_n, Q[6]);
    tff t7(clk, enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6], clear_n, Q[7]);

endmodule

module tff(input clk, input t, input clear, output reg q);
    always @(posedge clk or negedge clear)
    if (!clear) begin
        q <= 0;
    end else if (t) begin
        q <= ~q;
    end
endmodule