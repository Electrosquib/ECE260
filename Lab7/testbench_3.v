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
    reg ShiftIn;
    
    // Outputs
    wire ShiftOut;
    
    // Instantiate UUT
    lab7_1_3 DUT (
        .clk(clk),
        .ShiftIn(ShiftIn),
        .ShiftOut(ShiftOut)
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
        ShiftIn = 0;
        
        // Reset the shift register by toggling inputs
        // This ensures we don't get 'x' values
        #7 ShiftIn = 1;
        #3 ShiftIn = 0; // First posedge at 10ns
        #10 ShiftIn = 1; // Second posedge at 20ns
        #10 ShiftIn = 0; // Third posedge at 30ns
        
        // Now we can begin testing with known state
        #5; // t=35ns
        
        // Test 1: Verify initial state
        $sformat(input_string, "Test 1: Initial state (t=35ns)");
        $sformat(correct_string, "ShiftOut = 0");
        `assert(ShiftOut, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 2: Verify propagation of '1'
        ShiftIn = 1;
        #30; // Wait 3 clock cycles
        $sformat(input_string, "Test 2: '1' propagated (t=65ns)");
        $sformat(correct_string, "ShiftOut = 1");
        `assert(ShiftOut, 1'b1, correct_string, input_string, incorrect_string, "%b");
        
        // Test 3: Verify propagation of '0'
        ShiftIn = 0;
        #30;
        $sformat(input_string, "Test 3: '0' propagated (t=95ns)");
        $sformat(correct_string, "ShiftOut = 0");
        `assert(ShiftOut, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        // Test 4: Verify pattern 101
        ShiftIn = 1;
        #10;
        ShiftIn = 0;
        #10;
        ShiftIn = 1;
        #30;
        $sformat(input_string, "Test 4: Pattern '101' result (t=145ns)");
        $sformat(correct_string, "ShiftOut = 1");
        `assert(ShiftOut, 1'b1, correct_string, input_string, incorrect_string, "%b");
        
        // Final check
        ShiftIn = 0;
        #30;
        $sformat(input_string, "Test 5: Final state (t=175ns)");
        $sformat(correct_string, "ShiftOut = 0");
        `assert(ShiftOut, 1'b0, correct_string, input_string, incorrect_string, "%b");
        
        $display("All tests completed successfully");
        $finish;
    end
endmodule