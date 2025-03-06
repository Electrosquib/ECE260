`timescale 1ns / 1ps

module d_ff_chain_tb;

    reg D, Clock;
    wire Qa, Qb, Qc;

    d_ff_chain uut (
        .D(D),
        .Clock(Clock),
        .Qa(Qa),
        .Qb(Qb),
        .Qc(Qc)
    );

    always #5 Clock = ~Clock; 
    initial begin
        $display("Testing 3-Stage D Flip-Flop Chain");
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
