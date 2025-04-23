 module lab7_1_1(input [3:0] D, input clk,
 input reset, input load, output reg [3:0] Q);
      always @(posedge clk)
           if (reset)
           begin
                Q <= 4'b0;
           end else if (load)
           begin
                Q <= D;
           end
 endmodule