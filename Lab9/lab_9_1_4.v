`timescale 1ns / 1ps

module grey_code_generator (
    x,
    disabled,
    enable,
    Q
);
    input [3:0] x;
    output reg disabled;
    input enable;
    output [3:0] Q;
    reg [3:0] Q;

    always @(*) begin
        Q = 4'b0000;
        if (enable) begin
            disabled = 1'b0;
            case (x)
                4'b0000: Q = 4'b0000;
                4'b0001: Q = 4'b0001;
                4'b0010: Q = 4'b0011;
                4'b0011: Q = 4'b0010;
                4'b0100: Q = 4'b0110;
                4'b0101: Q = 4'b0111;
                4'b0110: Q = 4'b0101;
                4'b0111: Q = 4'b0100;
                4'b1000: Q = 4'b1100;
                4'b1001: Q = 4'b1101;
                4'b1010: Q = 4'b1111;
                4'b1011: Q = 4'b1110;
                4'b1100: Q = 4'b1010;
                4'b1101: Q = 4'b1011;
                4'b1110: Q = 4'b1001;
                4'b1111: Q = 4'b1000;
                default: Q = 4'b1111;
            endcase
        end else begin
            disabled = 1'b1;
            Q = 4'b1111;
        end
    end

endmodule
