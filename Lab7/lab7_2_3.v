 `timescale 1ns/1ps

 module lab7_2_3(input clk, input clear, input enable, input load, output reg [3:0] Q);
 wire cnt_done;
 assign cnt_done = ~| Q;

 always @(posedge clk)
      if (clear)
           Q <= 0;
      else if (enable)
           if (load | cnt_done)
           begin
                Q <= 4'b1010; 
           end
           else begin 
                Q <= Q - 1; 
                end

 endmodule