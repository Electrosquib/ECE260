 module lab7_1_3(input clk, input ShiftIn, output ShiftOut);
      reg [2:0] shift_reg;

      always @(posedge clk)
           shift_reg <= {shift_reg[1:0], ShiftIn};
      assign ShiftOut = shift_reg[2];

 endmodule