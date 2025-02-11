`define assert(actual, expected, outputName, inputs, description, type) \
    $write("\nTIME: "); $write($realtime); \
    if (actual == expected) \
        $display("   PASSED:   "); \
    else begin \
        $display(" ** FAILED:   "); \
        if (description) $display("TEST: %s", description); \
    end \
    $write("%s = ", outputName, type, actual); \
    $write(", EXPECTED: ", type, expected); \
    if (inputs) $display(" WITH: %s", inputs);
// End of `assert macro.

`timescale 1 ns/ 1 ns
module testbench;
   reg [1:0] a;
   reg [1:0] b;
	wire lt;
	wire gt;
	wire eq;
	reg [2:0] out;
	reg [2:0] e_out;
	integer i;
	
	reg [50*8:0] input_string;
   reg [50*8:0] correct_string;
   reg [50*8:0] incorrect_string;
    
   lab3_3_1 DUT (b, a, lt, gt, eq); 
    
   initial begin
      assign a = 2'b00;
      assign b = 2'b00;
      for (i=0; i < 16; i=i+1)
      begin
         
         out = {lt,gt,eq};
         
         if (b < a)
            assign e_out = 3'b100;
         else if (b > a)
            assign e_out = 3'b010;
         else
            assign e_out = 3'b001;
         
         $sformat(input_string, "inputs = %b, %b", a, b);
         $sformat(correct_string, "LED output should be %b and actually", e_out);
         $sformat(incorrect_string, "LED output should be %b", e_out);
         `assert(out, e_out, correct_string, input_string, incorrect_string, "%b")
         #50
         if (i%2 == 0)
         begin
            #50 assign a = a + 1'b1;
         end
         
         else
         begin
            #50 assign b = b + 1'b1;
         end
         
         if (i%4 == 0)
         begin
            assign b = b + 1'b1;
         end
      end
   end
endmodule