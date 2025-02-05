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
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] an;
    wire [6:0] seg;
    wire cout;
    wire z;
    
    reg [3:0] e_an;
    reg [6:0] e_seg;
    reg e_z;
    
    reg [50*8:0] input_string;
    reg [50*8:0] correct_string;
    reg [50*8:0] incorrect_string;
    
    lab2_3_2 DUT (.a(a), .b(b), .cin(cin), .an(an), .seg(seg), .cout(cout), .z(z));
    
   initial begin
         e_an = 4'b1110;
         #10
         $sformat(input_string, "");
         $sformat(correct_string, "Anode output should be %b and actually", e_an);
         $sformat(incorrect_string, "Anode output should be %b", e_an);         
         `assert(an, e_an, correct_string, input_string, incorrect_string, "%b")
         
         a = 4'b0011;
         b = 4'b1000;
         cin = 1'b0;
         e_seg = 7'b1001111;
         e_z = 1'b1;
         #10
         $sformat(input_string, "Inputs: a = %b, b = %b, c_in = %b", a, b, cin);
         
         $sformat(correct_string, "BCD Cathode output should be %b and actually", e_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", e_seg);         
         `assert(seg, e_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         a = 4'b0010;
         b = 4'b0001;
         cin = 1'b1;
         e_seg = 7'b1001100;
         e_z = 1'b0;
         #10
         $sformat(input_string, "Inputs: a = %b, b = %b, c_in = %b", a, b, cin);
         
         $sformat(correct_string, "BCD Cathode output should be %b and actually", e_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", e_seg);         
         `assert(seg, e_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         a = 4'b0100;
         b = 4'b0010;
         cin = 1'b0;
         e_seg = 7'b0100000;
         e_z = 1'b0;
         #10
         $sformat(input_string, "Inputs: a = %b, b = %b, c_in = %b", a, b, cin);
         
         $sformat(correct_string, "BCD Cathode output should be %b and actually", e_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", e_seg);         
         `assert(seg, e_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
         
         ////////////////////////////////////////////////////////////////////////////////////////
         
         a = 4'b1000;
         b = 4'b0100;
         cin = 1'b0;
         e_seg = 7'b0010010;
         e_z = 1'b1;
         #10
         $sformat(input_string, "Inputs: a = %b, b = %b, c_in = %b", a, b, cin);
         
         $sformat(correct_string, "BCD Cathode output should be %b and actually", e_seg);
         $sformat(incorrect_string, "BCD Cathode output should be %b", e_seg);         
         `assert(seg, e_seg, correct_string, input_string, incorrect_string, "%b")
         
         $sformat(correct_string, "LED output should be %b and actually", e_z);
         $sformat(incorrect_string, "LED output should be %b", e_z);         
         `assert(z, e_z, correct_string, input_string, incorrect_string, "%b")
   end
endmodule