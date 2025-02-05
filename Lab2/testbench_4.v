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
// Module Name: fulladder_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module testbench(
    );
    
    reg a, b, cin;
    reg [2:0] inputs;
    reg [1:0] sum_o;
    
    reg[50*8:0] input_string;
    reg[50*8:0] correct_string;
    reg[50*8:0] incorrect_string;
    
    integer i;
    
	 wire cout, s;
    
    lab2_3_1 DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
    
 
    initial
    begin
      inputs = 3'b000;
      for (i=0; i < 8; i=i+1)
         begin
            
            a = inputs[2]; b = inputs[1]; cin = inputs[0];
            sum_o = a + b + cin;
            
            #50 $sformat(input_string, "inputs: a = %b, b = %b, cin = %b", a, b, cin);
            $sformat(correct_string, "Output sum bit should be %b and actually", sum_o[0]);
            $sformat(incorrect_string, "Output sum bit should be %b", sum_o[0]);         
            `assert(s, sum_o[0], correct_string, input_string, incorrect_string, "%b")
            
            $sformat(correct_string, "Output overflow c_out bit should be %b and actually", sum_o[1]);
            $sformat(incorrect_string, "Output overflow c_out bit should be %b", sum_o[1]);         
            `assert(cout, sum_o[1], correct_string, input_string, incorrect_string, "%b")
            
            #50 inputs = inputs + 1;
            
         end
    end

endmodule
