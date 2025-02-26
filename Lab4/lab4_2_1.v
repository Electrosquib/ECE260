`timescale 1ns / 1ps


module add_two_values_function (
    input [3:0] ain,
    input [3:0] bin,
    output reg [4:0] sum
);
    
    function [4:0] add_two_values;
        input [3:0] a;
        input [3:0] b;

        {add_two_values[4], add_two_values[3:0]} = a + b;

    endfunction

    always @ (ain or bin)
        sum = add_two_values(ain, bin);

endmodule