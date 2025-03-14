`timescale 1ns/1ps

module lab6_1_1_tb;

    reg ain;
    reg clk;
    reg reset;
    wire yout;

    lab6_1_1 uut (
        .clk(clk),
        .reset(reset),
        .ain(ain),
        .yout(yout)
    );

    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
    end end

    initial begin
        reset = 1; #10;
        reset = 0; #10;
        ain = 0; #10;
        $display("TC1: ain=0 => yout=%b", yout);
        ain = 1; #10;
        $display("TC2: ain=1 => yout=%b", yout);
                ain = 1; #10;
        $display("TC2: ain=1 => yout=%b", yout);
                ain = 1; #10;
        $display("TC2: ain=1 => yout=%b", yout);
        ain = 1; #10;
        $display("TC3: ain=1 => yout=%b", yout);
        ain = 1; #10;
        $display("TC4: ain=1 => yout=%b", yout);
        ain = 1; #10;
        $display("TC5: ain=1 => yout=%b", yout);
        ain = 0; #10;
        $display("TC6: ain=0 => yout=%b", yout);
        ain = 0; #10;
        $display("TC7: ain=0 => yout=%b", yout);
        ain = 0; #10;
        $display("TC8: ain=0 => yout=%b", yout);
        $finish;
    end
endmodule