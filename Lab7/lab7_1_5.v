 module lab7_1_5(input clk, input ShiftIn,
 input [3:0] ParallelIn, input load, input ShiftEn, output ShiftOut, output
 [3:0] ParallelOut);
      reg [3:0] shift_reg;

 always @(posedge clk)
           if(load)
                shift_reg <= ParallelIn;
           else if (ShiftEn)
                shift_reg <= {shift_reg[2:0], ShiftIn};
      assign ShiftOut = shift_reg[3];
      assign ParallelOut = shift_reg;
 endmodule