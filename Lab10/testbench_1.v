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
    reg start;
    reg [2:0] multiplicand;
    reg [2:0] multiplier;
    
    // Outputs
    wire done;
    wire [5:0] product;
    
    // Test strings
    reg [300:0] input_string;
    reg [300:0] correct_string;
    reg [300:0] incorrect_string;
    
    // Clock period
    parameter CLK_PERIOD = 10;
    
    // Instantiate UUT
    three_by_three_bit_multiplier DUT (
        .clk(clk),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .done(done),
        .product(product)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Main test sequence
    initial begin
        // Initialize inputs
        start = 0;
        multiplicand = 3'b000;
        multiplier = 3'b000;
        #100; // Initial stabilization
        
        // Test 1: Simple multiplication (1x1)
        $sformat(input_string, "Test 1: 1x1 multiplication");
        multiplicand = 3'b001;
        multiplier = 3'b001;
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        
        // Wait for completion
        wait(done == 1);
        $sformat(correct_string, "Should output product=000001 (1)");
        `assert(product, 6'b000001, correct_string, input_string, incorrect_string, "%6b");
        
        // Test 2: Maximum multiplication (7x7)
        #(CLK_PERIOD*2);
        $sformat(input_string, "Test 2: 7x7 multiplication");
        multiplicand = 3'b111;
        multiplier = 3'b111;
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        
        wait(done == 1);
        $sformat(correct_string, "Should output product=110001 (49)");
        `assert(product, 6'b110001, correct_string, input_string, incorrect_string, "%6b");
        
        // Test 3: Edge case (0x4)
        #(CLK_PERIOD*2);
        $sformat(input_string, "Test 3: 0x4 multiplication");
        multiplicand = 3'b000;
        multiplier = 3'b100;
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        
        wait(done == 1);
        $sformat(correct_string, "Should output product=000000 (0)");
        `assert(product, 6'b000000, correct_string, input_string, incorrect_string, "%6b");
        
        // End simulation
        $display("Simulation complete");
        $finish;
    end
endmodule