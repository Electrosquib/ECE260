module testbench();
    reg [3:0] x;
    reg [1:0] sel;
    wire Q;

    four_to_one_mux dut (
        .x(x),
        .sel(sel),
        .Q(Q)
    );
    initial begin
        x = 4'b0101;
        sel = 2'b00;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);

        #5 sel = 2'b01;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);
        
        #5 sel = 2'b10;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);

        #5 sel = 2'b11;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);

        #5 sel = 2'bxx;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);

        #5 sel = 2'bxx;
        $display("Input: %b, Sel: %b, Output: %d", x, sel, Q);

    end

endmodule