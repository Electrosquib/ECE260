 module lab7_1_2(input [3:0] D, input clk, input SET, input reset, input load, output reg [3:0] Q);
      always @(posedge clk)
           if (reset)
           begin
                Q <= 4'b0;
                
           end 
           else if (SET)
           begin 
            Q <= 4'b1111;
           end else if (load)
           begin
                Q <= D;
           end
 endmodule