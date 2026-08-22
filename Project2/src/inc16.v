module Inc16(
    input wire [15:0] in,
    output wire [15:0] out
    );

    wire w1;
    Add16 add16_1(
        .a(in),
        .b(16'b0000000000000001),
        .sum(out),
        .carry(w1)
    );

endmodule