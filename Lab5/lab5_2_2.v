`timescale 1ns / 1ps

module lab5_2_2 (
    input D,
    input Clock,
    output reg Qa,
    output reg Qb,
    output reg Qc
)
    always @ (*) begin
        if (Clock) 
            Qa = D;
    end
    always @(posedge Clock) begin
        Qb <= D
    end
    always @(negedge Clock) begin
        Qc <= D
    end

endmodule