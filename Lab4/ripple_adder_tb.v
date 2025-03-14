`timescale 1ns/1ps

module ripple_adder_tb();
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] s;
    wire cout;

    lab2_3_1 add_module(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    function [3:0] expected_sum;
        input a;
        input b;
        input cin;
        begin
        expected_sum = a + b + cin;
        end
    endfunction

    integer i;
    reg [4:0] esum;
    initial begin
        for(i=0; i<512; i+=1) begin
            #50 a = i[7:3];
            #50 b = i[3:0];
            #50 cin = i[8];
            #10 esum = expected_sum(a, b, cin);
            $display(esum, s);
        end
    end

endmodule