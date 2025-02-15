`timescale 1ns / 1ps

module lab3_2_1 (
    input [0:7] v,
    input en_in_n,
    output reg [0:2] y,
    output reg en_out,
    output reg gs
);

always @(en_in_n or v) begin
if (en_in_n) begin
    y = 3'b111;
    gs = 1;
    en_out = 1;
end
else if (v[0:7] == 8'b11111111) begin
    y = 3'b111;
    gs = 1;
    en_out = 0;
end
else if (v[0:7] == 8'b11111110) begin
    y = 3'b111;
    gs = 0;
    en_out = 1;
end
else if (v[1:7] == 7'b11111110) begin
    y = 3'b000;
    gs = 0;
    en_out = 1;
end
else if (v[2:7] === 6'b111110) begin
    y = 3'b001;
    gs = 0;
    en_out = 1;
end
else if (v[3:7] === 5'b11110) begin
    y = 3'b010;
    gs = 0;
    en_out = 1;
end
else if (v[4:7] === 4'b1110) begin
    y = 3'b011;
    gs = 0;
    en_out = 1;
end
else if (v[5:7] === 3'b110) begin
    y = 3'b101;
    gs = 0;
    en_out = 1;
end
else if (v[6:7] === 2'b10) begin
    y = 3'b110;
    gs = 0;
    en_out = 1;
end
else if (v[7] === 1'b0) begin
    y = 3'b111;
    gs = 0;
    en_out = 1;
end
end

endmodule