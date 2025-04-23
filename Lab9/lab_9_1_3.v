`timescale 1ns / 1ps
module four_to_one_mux (
    input [3:0] x,
    input [1:0] sel,
    output reg Q
);
always @ (*) begin
    Q = 1'b1;
    if (sel == 2'b00) begin
        Q = x[0];
    end
    else if (sel == 2'b01) begin
        Q = x[1];
    end
    else if (sel == 2'b10) begin 
        Q = x[2];
    end
    else if (sel == 2'b11) begin
        Q = x[3];
    end
    else if (sel == 2'bxx) begin
        Q = 1'b1;
    end
    else begin
        Q = 1'b1;
    end end
endmodule