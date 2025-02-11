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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: decoder_74138_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module testbench(
    );
    
   reg [5:0] x;
	reg g1, g2a_n, g2b_n;
	wire [7:0] y;
	reg [7:0] e_y;
	integer k;
    
    lab3_1_2 DUT (.g1(g1), .g2a_n(g2a_n), .g2b_n(g2b_n), .x(x), .y(y));   
    
   reg [50*8:0] input_string;
   reg [50*8:0] correct_string;
   reg [50*8:0] incorrect_string;
 
    initial
    begin
    
         x = 3'b000;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11111110;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         
         x = 3'b001;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11111101;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         x = 3'b010;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11111011;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         x = 3'b011;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11110111;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")         


         x = 3'b100;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11101111;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b") 


         x = 3'b101;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b11011111;
         #10
         $sformat(input_string, "Input: x = %b", x);

         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")



         x = 3'b110;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b10111111;
         #10
         $sformat(input_string, "Input: x = %b", x);
          
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")         
         
         
         x = 3'b111;
         g1=1'b1;
         g2a_n=1'b0;
         g2b_n=1'b0;
         e_y = 8'b01111111;
         #10
         $sformat(input_string, "Input: x = %b", x);
          
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")                  
         ///x = 3'b001;
         //e_y = 8'b11111101;
        // #10
        // $sformat(input_string, "Input: x = %b", x);
         
        // $sformat(correct_string, "LED output should be %b and actually", e_y);
        // $sformat(incorrect_string, "LED output should be %b", e_y);         
        // `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
 //     x = 0; g1 = 0; g2a_n = 1; g2b_n = 1;
//	for (k=0; k < 8; k=k+1)
//		#5 x=k;
//	#10;
  //    x = 0; g1 = 1; g2a_n = 0; g2b_n = 1;
//	for (k=0; k < 8; k=k+1)
//		#5 x=k;
//	#10;
 //     x = 0; g1 = 0; g2a_n = 1; g2b_n = 0;
//	for (k=0; k < 8; k=k+1)
//		#5 x=k;
//	#10;
 //     x = 0; g1 = 1; g2a_n = 0; g2b_n = 0;
//	for (k=0; k < 8; k=k+1)
//		#5 x=k;
//	#10;
    end

endmodule
