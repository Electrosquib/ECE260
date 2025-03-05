`timescale 1ns/1ps

 module lab5_2_5(input Clk, input reset_n, input T, output reg Q);
      always @(negedge Clk)
           if (!reset_n)
                Q <= 1'b0;
           else if (T)
                Q <= ~Q;
 endmodule