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
/////////////////////////////////////////////////////////////////
// Module Name: testbench
/////////////////////////////////////////////////////////////////
module testbench(

    );
    
    reg [3:0] x;
    wire [3:0] an;
    wire [6:0] seg;
    reg [6:0] expected_seg;
    integer i;
    reg[50*8:0] input_string;
    reg[50*8:0] correct_string;
    reg[50*8:0] incorrect_string;

    // Instantiate the Unit Under Test (UUT)
    bcdto7segment_dataflow dut(
        .x(x), 
        .an(an),
        .seg(seg)
    );
    initial begin

      begin
         x = 4'b0000;
         expected_seg = 7'b000001;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")

         x = 4'b0001;
         expected_seg = 7'b1001111;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0010;
         expected_seg = 7'b0010010;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0011;
         expected_seg = 7'b0000110;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0100;
         expected_seg = 7'b1001100;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0101;
         expected_seg = 7'b0100100; 
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0110;
         expected_seg = 7'b0100000;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b0111;
         expected_seg = 7'b0001111;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1000;
         expected_seg = 7'b0000000;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1001;
         expected_seg = 7'b0000100;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
         x = 4'b1010;
         expected_seg = 7'b0000001;
         #10 
         $sformat(input_string, "Anode = %b", x);
         $sformat(correct_string, "BCD Cathode output should be %b and actually", expected_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", expected_seg);         
         `assert(seg, expected_seg, correct_string, input_string, incorrect_string, "%b")
         
       end     
    end
      
endmodule