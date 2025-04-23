`timescale 1ns / 1ps

module moore_counter (
    reset,
    enable,
    clk,
    Q
);
    input reset;
    input enable;
    input clk;
    output reg [2:0] Q;
    integer i = 1;

    always @(posedge clk) begin
        if (reset && enable) begin i = 1; Q = 3'b000; end
        else if (reset) begin i = 1; Q = 3'b000; end
        else if (enable) begin
            $display("i: ", i);
            case(i)
                0: Q = 3'b000;
                1: Q = 3'b001;
                2: Q = 3'b011;
                3: Q = 3'b101;
                4: Q = 3'b111;
                5: Q = 3'b010;
            endcase
            
            if (i == 5) begin i = 0; end
            else begin i = i + 1; end
        end
    end

endmodule
