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

// It looks like this testbench contains a "$finish" system task.
// Be aware that some simulation programs (e.g. Modelsim) will immediately close once the "$finish" system task is executed.
// If you find that your simulation program is closing unexpectedly, try removing any "$finish" system tasks in this file.

`timescale 1ns / 1ps



module testbench();

    // Inputs
    reg clk;
    reg clear;
    reg enable;
    reg load;
    
    // Outputs
    wire [3:0] Q;
    
    // Instantiate UUT
    lab7_2_3 DUT (
        .clk(clk),
        .clear(clear),
        .enable(enable),
        .load(load),
        .Q(Q)
    );
    
    // Testbench variables
    reg [300:0] input_string;
    reg [300:0] correct_string;
    reg [300:0] incorrect_string;
    
    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Stimulus and verification
    initial begin
        // Initialize inputs
        clear = 1;  // Start with clear active
        enable = 0;
        load = 0;
        
        // Test 1: Verify clear
        #10;
        $sformat(input_string, "Test 1: Clear (t=10ns)");
        $sformat(correct_string, "Q = 0000");
        `assert(Q, 4'b0000, correct_string, input_string, incorrect_string, "%04b");
        
        // Begin counting
        clear = 0;
        enable = 1;
        
        // Test 2: Verify initial load to 1010
        #10;
        $sformat(input_string, "Test 2: Initial load (t=20ns)");
        $sformat(correct_string, "Q = 1010");
        `assert(Q, 4'b1010, correct_string, input_string, incorrect_string, "%04b");
        
        // Test 3: Verify first decrement
        #10;
        $sformat(input_string, "Test 3: First decrement (t=30ns)");
        $sformat(correct_string, "Q = 1001");
        `assert(Q, 4'b1001, correct_string, input_string, incorrect_string, "%04b");
        
        // Continue counting down through the sequence
        // 1001 (t=30), 1000 (t=40), 0111 (t=50), 0110 (t=60),
        // 0101 (t=70), 0100 (t=80), 0011 (t=90), 0010 (t=100),
        // 0001 (t=110), 0000 (t=120), then reload to 1010 (t=130)
        
        // Test 4: Verify count reaches zero
        #90; // Wait until t=120ns
        $sformat(input_string, "Test 4: Count reaches zero (t=120ns)");
        $sformat(correct_string, "Q = 0000");
        `assert(Q, 4'b0000, correct_string, input_string, incorrect_string, "%04b");
        
        // Test 5: Verify automatic reload after zero
        #10; // Wait one more cycle (t=130ns)
        $sformat(input_string, "Test 5: Wrap-around reload (t=130ns)");
        $sformat(correct_string, "Q = 1010");
        `assert(Q, 4'b1010, correct_string, input_string, incorrect_string, "%04b");
        
        $display("All down counter tests completed successfully");
        #10 $finish;
    end
endmodule