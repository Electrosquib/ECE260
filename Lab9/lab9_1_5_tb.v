`timescale 1ns / 1ps

module testbench;
    reg reset;
    reg enable;
    reg clk;
    wire [3:0] out;

    four_to_one_mux dut (
        .reset(reset),
        .enable(enable),
        .clk(clk),
        .out(out)
    );

    initial begin
        enable = 1'b1;

        repeat(20) begin
            #5 clk = 1'b0;
            clk = 1'b1;
            $display("Value: %b", out);
        end

        #5 $finish;
    end

endmodule
