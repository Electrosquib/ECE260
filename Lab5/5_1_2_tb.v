`timescale 1ns / 1ps

module gated_sr_latch_tb;

    reg S, R, E;
    wire Q, Qbar;

    gated_sr_latch uut (
        .S(S),
        .R(R),
        .E(E),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $display("Testing Gated SR Latch");

        E = 0; S = 0; R = 0; #10;
        $display("TC1: E=0, S=0, R=0 => Q=%b, Qbar=%b", Q, Qbar);

        E = 1; S = 0; R = 1; #10;
        $display("TC2: E=1, S=0, R=1 => Q=%b, Qbar=%b", Q, Qbar);

        E = 1; S = 1; R = 0; #10;
        $display("TC3: E=1, S=1, R=0 => Q=%b, Qbar=%b", Q, Qbar);

        E = 1; S = 0; R = 0; #10;
        $display("TC4: E=1, S=0, R=0 => Q=%b, Qbar=%b", Q, Qbar);

        E = 0; S = 1; R = 1; #10;
        $display("TC5: E=0, S=1, R=1 => Q=%b, Qbar=%b", Q, Qbar);

        E = 1; S = 1; R = 1; #10;
        $display("TC6: E=1, S=1, R=1 => Q=%b, Qbar=%b", Q, Qbar);

        $finish;
    end

endmodule
