`timescale 1ns/1ps

module lab7_2_2(input clk, input T, input clear_n, output Q);
    dff t0(clk, T^Q, clear_n, Q);
    // dff t0(clk, enable, clear_n, Q[0]);
    // dff t1(clk, (enable & Q[0]) ^ Q[1], clear_n, Q[1]);
    // dff t2(clk, (enable & Q[0] & Q[1]) ^ Q[2], clear_n, Q[2]);
    // dff t3(clk, (enable & Q[0] & Q[1] & Q[2]) ^ Q[3], clear_n, Q[3]);
    // dff t4(clk, (enable & Q[0] & Q[1] & Q[2] & Q[3]) ^ Q[4], clear_n, Q[4]);
    // dff t5(clk, (enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4]) ^ Q[5], clear_n, Q[5]);
    // dff t6(clk, (enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5]) ^ Q[6], clear_n, Q[6]);
    // dff t7(clk, (enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6]) ^ Q[7], clear_n, Q[7]);
endmodule

module dff(input clk, input T, input clear_n, output reg Q);
    always @(posedge clk or negedge clear_n)
    if (!clear_n) begin
        Q <= 0;
    end else begin
        Q <= T;
    end
endmodule