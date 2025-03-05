`timescale 1ns / 1ps

module d_ff_tb;

    reg D, Clock;
    wire Q;

    d_ff uut (
        .D(D),
        .Clock(Clock),
        .Q(Q)
    );

    always #5 Clock = ~Clock;

    initial begin
        $display("Testing D Flip-Flop");

        Clock = 0; D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 0; #20;

        $finish;
    end

endmodule
