`timescale 1ns / 1ps

module D_latch_dataflow (
    input D,
    input Enable,
    output Q,
    output Qbar
);
    assign Qbar = ~((D & Enable) | Q);
    assign Q = ~((~D & Enable) | Qbar);
endmodule