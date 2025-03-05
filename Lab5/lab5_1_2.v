`timescale 1ns / 1ps

module lab5_1_2 (
    input S,
    input R,
    input E,
    output Q,
    output Qbar
);
    assign Qbar = ~((S & E) | Q);
    assign Q = ~((R & E) | Qbar);
endmodule