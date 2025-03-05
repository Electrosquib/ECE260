`timescale 1ns / 1ps

 module lab5_2_1 (input D, input Clk, output reg Q);
 always @ (posedge Clk)
      if(Clk)
      begin
           Q <= D;
      end
 endmodule