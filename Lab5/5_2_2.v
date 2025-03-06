`timescale 1ns / 1ps

module D_latch_demo_behavior (
    input D,
    input Clk,
    output reg Qa,
    output reg Qb,
    output reg Qc
);
    always @ (*) begin
        if (Clk) 
            Qa = D;
    end
    always @(posedge Clk) begin
        Qb <= D;
    end
    always @(negedge Clk) begin
        Qc <= D;
    end

endmodule