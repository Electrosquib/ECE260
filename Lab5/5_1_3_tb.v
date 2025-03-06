`timescale 1ns / 1ps

module d_latch_tb;

    reg D, E;
    wire Q, Qbar;

    // Instantiate the DUT (Device Under Test)
    d_latch uut (
        .D(D),
        .E(E),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $display("Testing D Latch");

        // Initial state
        D = 0; E = 0; #10;
        $display("TC1: E=0, D=0 => Q=%b, Qbar=%b", Q, Qbar);

        // Enable latch and set D to 1
        E = 1; D = 1; #10;
        $display("TC2: E=1, D=1 => Q=%b, Qbar=%b", Q, Qbar);

        // Keep enable high, change D
        D = 0; #10;
        $display("TC3: E=1, D=0 => Q=%b, Qbar=%b", Q, Qbar);

        // Disable latch, check holding state
        E = 0; #10;
        $display("TC4: E=0, D=0 => Q=%b, Qbar=%b", Q, Qbar);

        // Change D while enable is low, Q should remain the same
        D = 1; #10;
        $display("TC5: E=0, D=1 => Q=%b, Qbar=%b", Q, Qbar);

        // Re-enable and check update
        E = 1; #10;
        $display("TC6: E=1, D=1 => Q=%b, Qbar=%b", Q, Qbar);

        $finish;
    end

endmodule
