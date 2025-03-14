`timescale 1ns/1ps

module mealy_sequence_fsm (
    input clk,
    input reset,
    output reg [2:0] yout,
    output reg [2:0] count,
    output reg [2:0] next_state
);
    reg [2:0] state, ns;

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            count <= 3'b000;
            next_state <= S0;
            state <= S0;
        end
        else begin
            state <= ns;
        end
    end

    always @(*)
    begin
        case (state)
        S0: begin 
            ns = S1;
            // yout = 3'b000;
        end
        S1: begin 
            ns = S2;
            // yout = 3'b001;
        end
        S2: begin 
            ns = S3;
            // yout = 3'b011;
        end
        S3: begin 
            ns = S4;
            // yout = 3'b101;
        end
        S4: begin 
            ns = S5;
            // yout = 3'b111;
        end
        S5: begin 
            ns = S0;
            // yout = 3'b010;
        end
        endcase
        // count = yout;
        // next_state = ns;
    end

    always @(posedge clk)
    begin
        case (state)
            S0: yout = 3'b000;
            S1: yout = 3'b001;
            S2: yout = 3'b011;
            S3: yout = 3'b101;
            S4: yout = 3'b111;
            S5: yout = 3'b010;
        endcase
        count = yout;
        next_state = ns;
    end

endmodule