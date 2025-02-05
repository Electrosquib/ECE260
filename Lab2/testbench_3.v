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
   reg [3:0] x;
   wire [4:0] y;
   
   reg [5:0] e_y;
    
   reg [50*8:0] input_string;
   reg [50*8:0] correct_string;
   reg [50*8:0] incorrect_string;
   
   lab2_2_2 DUT(.x(x), .y(y));
   
   initial begin
         
         x = 4'b0000;
         e_y = 5'b00011;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 4'b0101;
         e_y = 5'b01100;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 4'b0010;
         e_y = 5'b00110;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 4'b1001;
         e_y = 5'b11000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")

   end
endmodule