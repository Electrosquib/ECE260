`timescale 1ns / 1ps

module lab4_1_2 (
    input [7:0] ain,
    output reg parity
);    


task calc_even_parity;
    input [7:0] a;
    output p;
    integer i;
    reg [3:0] s;
    begin
        s = 0;

        for (i = 0; i < 8; i += 1) begin
            s += a[i];
        end
        assign p = (s % 2);
    end

    endtask


    always @ (ain)
        calc_even_parity(ain, parity);

endmodule