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
    reg T;
    
    // Outputs
    wire Q;
    
    // Instantiate UUT
    lab7_2_2 DUT (
        .clk(clk),
        .clear_n(clear_n),
        .T(T),
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
        T = 0;
        
        // Test 1: Synchronous reset
        clear_n = 0;
        #10;
        $sformat(input_string, "Test 1: Reset active (t=10ns)");
        $sformat(correct_string, "Q = 0");
        `assert(Q, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 2: Normal operation (T=0)
        clear_n = 1;
        T = 0;
        #10;
        $sformat(input_string, "Test 2: T=0 (t=20ns)");
        $sformat(correct_string, "Q remains 0");
        `assert(Q, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 3: Toggle (T=1)
        T = 1;
        #10;
        $sformat(input_string, "Test 3: First toggle (t=30ns)");
        $sformat(correct_string, "Q = 1");
        `assert(Q, 1'b1, correct_string, input_string, incorrect_string, "%b");
        
        // Test 4: Continue toggle (T=1)
        #10;
        $sformat(input_string, "Test 4: Second toggle (t=40ns)");
        $sformat(correct_string, "Q = 0");
        `assert(Q, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 5: Stop toggle (T=0)
        T = 0;
        #10;
        $sformat(input_string, "Test 5: T=0 (t=50ns)");
        $sformat(correct_string, "Q remains 0");
        `assert(Q, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 6: Reset during operation
        T = 1;
        #5;
        clear_n = 0;
        #5;
        $sformat(input_string, "Test 6: Reset during toggle (t=60ns)");
        $sformat(correct_string, "Q = 0");
        `assert(Q, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 7: Resume operation
        clear_n = 1;
        #10;
        $sformat(input_string, "Test 7: Post-reset toggle (t=70ns)");
        $sformat(correct_string, "Q = 1");
        `assert(Q, 1'b1, correct_string, input_string, incorrect_string, "%b");
        
        $display("All D flip-flop with toggle tests completed successfully");
        #10 $finish;
    end
endmodule