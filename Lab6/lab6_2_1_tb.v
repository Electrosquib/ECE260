`timescale 1ns/1ps

module lab6_2_1_tb;

    reg [1:0] ain;
    reg clk;
    reg reset;
    wire yout;
    wire [2:0] state;

    moore_sequence_fsm uut (
        .clk(clk),
        .reset(reset),
        .ain(ain),
        .yout(yout),
        .state(state)
    );

    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
    end end

    initial begin
        reset = 1; #10;
        reset = 0; #10;

ain = 2'b01; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);

ain = 2'b00; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);


ain = 2'b10; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);

ain = 2'b00; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);

ain = 2'b00; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);
ain = 2'b00; #10;
        $display("ain=%b | yout=%b | state=%b", ain, yout, state);


        $finish;
    end
endmodule