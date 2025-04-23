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
    reg clear_n;
    reg enable;
    
    // Outputs
    wire [7:0] Q;
    
    // Instantiate UUT
    lab7_2_1 DUT (
        .clk(clk),
        .clear_n(clear_n),
        .enable(enable),
        .Q(Q)
    );
    
    // Testbench variables
    reg [100:0] input_string;
    reg [100:0] correct_string;
    reg [100:0] incorrect_string;
    
    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Stimulus and verification
    initial begin
        // Initialize inputs
        clear_n = 1;
        enable = 0;
        
        // Test 1: Asynchronous clear
        clear_n = 0;
        #15;
        $sformat(input_string, "Test 1: Clear active (t=15ns)");
        $sformat(correct_string, "Q = 00000000");
        `assert(Q, 8'b00000000, correct_string, input_string, incorrect_string, "%b");
        
        // Test 2: Enable counting
        clear_n = 1;
        enable = 1;
        #10;
        $sformat(input_string, "Test 2: First enable (t=25ns)");
        $sformat(correct_string, "Q = 00000001");
        `assert(Q, 8'b00000001, correct_string, input_string, incorrect_string, "%b");
        
        // Test 3: Verify ripple behavior
        #10;
        $sformat(input_string, "Test 3: Second clock (t=35ns)");
        $sformat(correct_string, "Q = 00000010");
        `assert(Q, 8'b00000010, correct_string, input_string, incorrect_string, "%b");
        
        // Test 4: Continue counting
        #10;
        $sformat(input_string, "Test 4: Third clock (t=45ns)");
        $sformat(correct_string, "Q = 00000011");
        `assert(Q, 8'b00000011, correct_string, input_string, incorrect_string, "%b");
        
        // Test 5: Verify full ripple
        #80;
        $sformat(input_string, "Test 5: Full count (t=125ns)");
        $sformat(correct_string, "Q = 00001011");
        `assert(Q, 8'b00001011, correct_string, input_string, incorrect_string, "%b");
        
        // Test 6: Clear during counting
        clear_n = 0;
        #10;
        $sformat(input_string, "Test 6: Clear during count (t=135ns)");
        $sformat(correct_string, "Q = 00000000");
        `assert(Q, 8'b00000000, correct_string, input_string, incorrect_string, "%b");
        
        // Test 7: Disable counting
        clear_n = 1;
        enable = 0;
        #30;
        $sformat(input_string, "Test 7: Counting disabled (t=165ns)");
        $sformat(correct_string, "Q remains 00000000");
        `assert(Q, 8'b00000000, correct_string, input_string, incorrect_string, "%b");
        
        // Test 8: Re-enable counting
        enable = 1;
        #80;
        $sformat(input_string, "Test 8: Re-enabled count (t=245ns)");
        $sformat(correct_string, "Q = 00001000");
        `assert(Q, 8'b00001000, correct_string, input_string, incorrect_string, "%b");
        
        $display("All ripple counter tests completed successfully");
        #10 $finish;
    end
endmodule