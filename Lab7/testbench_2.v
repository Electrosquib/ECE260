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
    reg clk;
    reg reset;
    reg load;
    reg SET;
    reg [3:0] D;
    wire [3:0] Q;
    
    lab7_1_2 DUT (.D(D), .clk(clk), .reset(reset), .load(load), .SET(SET), .Q(Q));
    
    reg [100:0] input_string;
    reg [100:0] correct_string;
    reg [100:0] incorrect_string;
    
    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        // Initialize all inputs
        reset = 0;
        load = 0;
        SET = 0;
        D = 4'b0000;
        
        // Test 1: Verify highest priority reset
        reset = 1;
        #10;
        $sformat(input_string, "Test 1: Reset=1 (Highest Priority)");
        $sformat(correct_string, "Q = 0000");
        `assert(Q, 4'b0000, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 2: SET functionality
        reset = 0;
        SET = 1;
        #10;
        $sformat(input_string, "Test 2: SET=1 (Medium Priority)");
        $sformat(correct_string, "Q = 1111");
        `assert(Q, 4'b1111, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 3: Load functionality
        SET = 0;
        load = 1;
        D = 4'b1010;
        #10;
        $sformat(input_string, "Test 3: Load=1 (Lowest Priority)");
        $sformat(correct_string, "Q = 1010");
        `assert(Q, 4'b1010, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 4: Reset overrides SET and Load
        reset = 1;
        SET = 1;
        load = 1;
        D = 4'b1111;
        #10;
        $sformat(input_string, "Test 4: Reset=1, SET=1, Load=1");
        $sformat(correct_string, "Q = 0000 (Reset Dominates)");
        `assert(Q, 4'b0000, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 5: SET overrides Load
        reset = 0;
        SET = 1;
        load = 1;
        D = 4'b0101;
        #10;
        $sformat(input_string, "Test 5: SET=1, Load=1");
        $sformat(correct_string, "Q = 1111 (SET Dominates)");
        `assert(Q, 4'b1111, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 6: Data retention
        SET = 0;
        load = 0;
        D = 4'b1100;
        #10;
        $sformat(input_string, "Test 6: No control signals");
        $sformat(correct_string, "Q remains 1111");
        `assert(Q, 4'b1111, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 7: Load after SET
        load = 1;
        D = 4'b0011;
        #10;
        $sformat(input_string, "Test 7: Load=1 after SET");
        $sformat(correct_string, "Q = 0011");
        `assert(Q, 4'b0011, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 8: Mid-operation SET
        load = 0;
        SET = 1;
        #10;
        $sformat(input_string, "Test 8: SET=1 during operation");
        $sformat(correct_string, "Q = 1111");
        `assert(Q, 4'b1111, correct_string, input_string, incorrect_string, "%4b");
        
        // Test 9: Final priority check
        reset = 1;
        SET = 1;
        load = 1;
        D = 4'b0110;
        #10;
        $sformat(input_string, "Test 9: All signals active");
        $sformat(correct_string, "Q = 0000 (Reset Priority)");
        `assert(Q, 4'b0000, correct_string, input_string, incorrect_string, "%4b");
        
        // End simulation
        #10 $finish;
    end
endmodule