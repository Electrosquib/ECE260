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
// Module Name: decoder_3to8_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module testbench(
    );
    
   reg [2:0] x;
	wire [7:0] y;
	reg [7:0] e_y;
	//integer k;
	
	reg [50*8:0] input_string;
   reg [50*8:0] correct_string;
   reg [50*8:0] incorrect_string;
    
    lab3_1_1 DUT (.x(x), .y(y));   
 
    initial
    begin
         x = 3'b000;
         e_y = 8'b00000001;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b001;
         e_y = 8'b00000010;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b010;
         e_y = 8'b00000100;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b011;
         e_y = 8'b00001000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         //////////////////////////////////////////////////////////////////////////////////////////
         x = 3'b100;
         e_y = 8'b00010000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         /////////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b101;
         e_y = 8'b00100000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         ////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b110;
         e_y = 8'b01000000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////////
         
         x = 3'b111;
         e_y = 8'b10000000;
         #10
         $sformat(input_string, "Input: x = %b", x);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")
    
     // x = 0; 
//	for (k=0; k < 8; k=k+1)
	//	#5 x=k;
//	#10;
    end

endmodule
