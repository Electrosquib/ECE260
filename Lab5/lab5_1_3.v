`timescale 1ns / 1ps

module lab5_1_3 (
    input D,
    input E,
    output Q,
    output Qbar
);
    assign Qbar = ~((D & E) | Q);
    assign Q = ~((~D & E) | Qbar);
endmodule