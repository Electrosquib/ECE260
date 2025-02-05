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
// Module Name: lab2_2_1_partA_tb
//////////////////////////////////////////////////////////////////////////////////

module testbench(
    );
    reg[50*8:0] input_string;
    reg[50*8:0] correct_string;
    reg[50*8:0] incorrect_string;
    reg [6:0] expected_seg;
    reg [3:0] e_an;
    reg [0:0] e_z;
    
    reg [3:0] x;
    wire [6:0] seg;
	 wire [3:0] an;
	 wire z;
    
    lab2_2_1 DUT (.v(x), .z(z), .an(an), .seg(seg));
    
    initial
    begin
         e_an = 4'b1110;
         #10
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "Anode output should be %b and actually", e_an);
         $sformat(incorrect_string, "Anode output should be %b", e_an);         
         `assert(an, e_an, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0000;
         expected_seg = 7'b0000001;
         e_z = 0;
         #10
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0001;
         expected_seg = 7'b1001111;
         e_z = 0;
         #10
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0010;
         expected_seg = 7'b0010010;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0011;
         expected_seg = 7'b0000110;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0100;
         expected_seg = 7'b1001100;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0101;
         expected_seg = 7'b0100100; 
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0110;
         expected_seg = 7'b0100000;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0111;
         expected_seg = 7'b0001111;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1000;
         expected_seg = 7'b0000000;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1001;
         expected_seg = 7'b0000100;
         e_z = 0;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1010;
         expected_seg = 7'b0000001;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1011;
         expected_seg = 7'b1001111;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1100;
         expected_seg = 7'b0010010;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1101;
         expected_seg = 7'b0000110;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1110;
         expected_seg = 7'b1001100;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
          
         x = 4'b1111;
         expected_seg = 7'b0100100;
         e_z = 1;
         #10 
         $sformat(input_string, "Input switches = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
	 #20;
    end

endmodule
