`timescale 1ns / 1ps

module calc_even_parity_task (
    input [7:0] ain,
    output reg parity
);    


task calc_even_parity;
    input [7:0] a;
    output p;

    assign p = (a % 2);

    endtask


    always @ (ain)
        calc_even_parity(ain, parity);

endmodule