`timescale 1ns/1ps

module mealy_state_machine (
    input ain,
    input clk,
    input reset,
    output reg count,
    output reg yout
);
    reg [1:0] state, next_state;

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk, posedge reset)
    begin
        if (reset) begin
            count = 1'b0;
            yout = 1'b0;
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end

    always @(posedge clk or count)
    begin
        case (state)
            S0:
            if (ain) begin
                count = 1'b0;
                next_state <= S2;
            end
            else
            begin
                count <= 1'b0;
                next_state <= S1;
            end
            S1:
            if (ain)
            begin
                count <= 1'b0;
                next_state <= S2;
            end
            else
            begin
                count <= 1'b0;
                next_state <= S1;
            end
            S2:
            if (ain)
            begin
                count <= 1'b0;
                next_state <= S3;
            end
            else
            begin
                count <= 1'b0;
                next_state <= S2;
            end
            S3:
            if (ain)
            begin
                count <= 1'b1;
                next_state <= S1;
            end
            else
            begin
                count <= 1'b0;
                next_state <= S3;
            end
        endcase
    end

    always @(posedge clk or ain)
    begin
        case (state)
            S0:
            count = 1'b0;

            S1:
            count = 1'b1;

            S2:
            count = 1'b0;

            S3:
            count = 1'b0;
        endcase
        assign yout = count;
    end

endmodule