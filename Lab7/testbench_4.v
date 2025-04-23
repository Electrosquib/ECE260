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
    reg [3:0] ParallelIn;
    reg load;
    reg ShiftEn;
    
    // Outputs
    wire ShiftOut;
    wire [3:0] RegContent;
    
    // Instantiate UUT
    lab7_1_4 DUT (
        .clk(clk),
        .ShiftIn(ShiftIn),
        .ParallelIn(ParallelIn),
        .load(load),
        .ShiftEn(ShiftEn),
        .ShiftOut(ShiftOut),
        .RegContent(RegContent)
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
        // Initialize all inputs to known values
        ShiftIn = 0;
        ParallelIn = 4'b0000;
        load = 0;
        ShiftEn = 0;
        
        // Power-on reset sequence
        // 1. Apply load with known parallel data
        load = 1;
        ParallelIn = 4'b0000;
        #10; // Hold through first clock edge
        
        // 2. Release load and verify initialization
        load = 0;
        #1; // Small delay after clock edge
        
        // Test 1: Verify initial state
        $sformat(input_string, "Test 1: Initial state (t=11ns)");
        $sformat(correct_string, "RegContent = 0000, ShiftOut = 0");
        `assert({RegContent, ShiftOut}, 5'b00000, correct_string, input_string, incorrect_string, "%b");
        
        // Test 2: Parallel load operation
        ParallelIn = 4'b1101;
        load = 1;
        #10;
        load = 0;
        $sformat(input_string, "Test 2: Parallel load 1101 (t=21ns)");
        $sformat(correct_string, "RegContent = 1101, ShiftOut = 1");
        `assert({RegContent, ShiftOut}, 5'b11011, correct_string, input_string, incorrect_string, "%b");
        
        // Test 3: Shift operation (MSB first)
        ShiftIn = 1'b0;
        ShiftEn = 1;
        #10;
        $sformat(input_string, "Test 3: First shift (t=31ns)");
        $sformat(correct_string, "RegContent = 1010, ShiftOut = 1");
        `assert({RegContent, ShiftOut}, 5'b10101, correct_string, input_string, incorrect_string, "%b");
        
        // Test 4: Continue shifting
        ShiftIn = 1'b1;
        #10;
        $sformat(input_string, "Test 4: Second shift (t=41ns)");
        $sformat(correct_string, "RegContent = 0101, ShiftOut = 0");
        `assert({RegContent, ShiftOut}, 5'b01010, correct_string, input_string, incorrect_string, "%b");
        
        // Test 5: Final shift
        ShiftIn = 1'b0;
        #10;
        $sformat(input_string, "Test 5: Third shift (t=51ns)");
        $sformat(correct_string, "RegContent = 1010, ShiftOut = 1");
        `assert({RegContent, ShiftOut}, 5'b10101, correct_string, input_string, incorrect_string, "%b");
        
        $display("All PISO shift register tests completed");
        #10 $finish;
    end
endmodule