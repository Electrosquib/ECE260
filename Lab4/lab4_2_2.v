`timescale 1ns / 1ps


module lab4_2_2 (
    input [7:0] ain,
    output reg [3:0] number_of_ones
);
    
    task calc_ones;
        input [7:0] a;
        output [3:0] out;
        integer i;
        reg [3:0] s;
        begin
            s = 0;

            for (i = 0; i < 8; i += 1) begin
                s += a[i];
            end

            out = s;
        end

    endtask

    always @ (ain) begin
        calc_ones(ain, number_of_ones);
    end

endmodule