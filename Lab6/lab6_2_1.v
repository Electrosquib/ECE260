`timescale 1ns/1ps

module moore_sequence_fsm (
    input [1:0] ain,
    input clk,
    input reset,
    output reg yout,
    output reg [2:0] state
);
    reg [2:0] next_state;

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*)
    begin
        case (state)
            S0:
                if (ain == 2'b01) begin
                    next_state <= S1;
                end
                else if (ain == 2'b10) begin
                    next_state <= S2;
                end
                else if (ain == 2'b11) begin
                    next_state <= S3;
                end
                else
                begin
                    next_state <= S0;
                end

            S1:
                if (ain == 2'b00)
                begin
                    next_state <= S0;
                end
                else
                begin
                    next_state <= S0;
                end

            S3:
                if (ain == 2'b00) begin
                    next_state <= S5;
                end
                else begin
                    next_state <= S0;
                end

            S2:
                if (ain == 2'b00) begin
                    next_state <= S4;
                    // yout = ~yout;
                end
                else begin
                    next_state <= S0;
                end
        endcase

    end

    always @(posedge clk)
    begin
        case (next_state)
            S0:
            yout <= 1'b0;

            S1:
            yout <= 1'b0;

            S2:
            yout <= 1'b0;

            S3:
            yout <= 1'b0;

            S4:
            yout <= 1'b1;

            S5: 
            yout <= 1'b1;
        endcase

    end

endmodule