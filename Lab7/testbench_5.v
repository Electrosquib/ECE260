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
    reg ShiftEn;
    reg ShiftIn;
    
    // Outputs
    wire [3:0] ParallelOut;
    wire ShiftOut;
    
    // Instantiate UUT
    lab7_1_5 DUT (
        .clk(clk),
        .ShiftEn(ShiftEn),
        .ShiftIn(ShiftIn),
        .ParallelOut(ParallelOut),
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
        // Initialize all inputs
        ShiftIn = 0;
        ShiftEn = 0;
        
        // POWER-ON RESET SEQUENCE
        // 1. Apply reset by shifting in zeros for 4 cycles
        ShiftEn = 1;
        ShiftIn = 0;
        #40; // 4 clock cycles to fill register with zeros
        
        // 2. Verify initialization
        ShiftEn = 0;
        #1; // Small delay after last clock edge
        $sformat(input_string, "Test 1: Initialized state (t=41ns)");
        $sformat(correct_string, "ParallelOut = 0000, ShiftOut = 0");
        `assert({ParallelOut, ShiftOut}, 5'b00000, correct_string, input_string, incorrect_string, "%b");
        
        // Test 2: Shift in '1' (LSB first)
        ShiftEn = 1;
        ShiftIn = 1;
        #10;
        $sformat(input_string, "Test 2: First shift (t=51ns)");
        $sformat(correct_string, "ParallelOut = 0001, ShiftOut = 0");
        `assert({ParallelOut, ShiftOut}, 5'b00010, correct_string, input_string, incorrect_string, "%b");
        
        // Test 3: Shift in '0'
        ShiftIn = 0;
        #10;
        $sformat(input_string, "Test 3: Second shift (t=61ns)");
        $sformat(correct_string, "ParallelOut = 0010, ShiftOut = 0");
        `assert({ParallelOut, ShiftOut}, 5'b00100, correct_string, input_string, incorrect_string, "%b");
        
        // Test 4: Shift in '1'
        ShiftIn = 1;
        #10;
        $sformat(input_string, "Test 4: Third shift (t=71ns)");
        $sformat(correct_string, "ParallelOut = 0101, ShiftOut = 0");
        `assert({ParallelOut, ShiftOut}, 5'b01010, correct_string, input_string, incorrect_string, "%b");
        
        // Test 5: Final shift to fill register
        ShiftIn = 1;
        #10;
        $sformat(input_string, "Test 5: Fourth shift (t=81ns)");
        $sformat(correct_string, "ParallelOut = 1011, ShiftOut = 1");
        `assert({ParallelOut, ShiftOut}, 5'b10111, correct_string, input_string, incorrect_string, "%b");
        
        $display("All SIPO shift register tests completed successfully");
        #10 $finish;
    end
endmodule