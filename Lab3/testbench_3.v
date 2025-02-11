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
    
   reg [7:0] v;
	reg en_in_n;
	wire [2:0] y;
	reg [7:0] e_y;
	wire en_out;
	wire gs;
    
    lab3_2_1 DUT (.v(v), .en_in_n(en_in_n), .y(y), .en_out(en_out), .gs(gs));   
    
   reg [50*8:0] input_string;
   reg [50*8:0] correct_string;
   reg [50*8:0] incorrect_string;
 
    initial
    begin
    
         v = 8'b11111110;
         en_in_n=1'b0;
         //gs=1'b0;
         //en_out=1'b1;
         
         e_y = 3'b111;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b");
       
///////////////////////////////////////////////////////////////////////////////////////////       
   
         en_in_n=1'b1;
         
         e_y = 3'b111;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")    

//////////////////////////////////////////////////////////////////////////////////         
         
         en_in_n=1'b0;
         v[7]=1'b0;
         e_y = 3'b000;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")       
         
////////////////////////////////////////////////////////////////////////         
         
         en_in_n=1'b0;
         v[7:6]=2'b10;
         e_y = 3'b001;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")        
/////////////////////////////////////////////////////////////////////////////

         en_in_n=1'b0;
         v[7:5]=3'b110;
         e_y = 3'b010;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
         $sformat(correct_string, "LED output should be %b and actually", e_y);
         $sformat(incorrect_string, "LED output should be %b", e_y);         
         `assert(y, e_y, correct_string, input_string, incorrect_string, "%b")    
//////////////////////////////////////////////////////////////////////////////////

         en_in_n=1'b0;
         v[7:4]=4'b1110;
         e_y = 3'b011;
         #10
         $sformat(input_string, "Input: v = %b", v);
         
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
