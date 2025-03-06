`timescale 1ns / 1ps

module gated_SR_latch_dataflow (
    input S,
    input R,
    input Enable,
    output Q,
    output Qbar
);
    assign Qbar = ~((S & Enable) | Q);
    assign Q = ~((R & Enable) | Qbar);
endmodule