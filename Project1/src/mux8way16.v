module Mux8way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [15:0] e,
    input wire [15:0] f,
    input wire [15:0] g,
    input wire [15:0] h,
    input wire [2:0] s,
    output wire [15:0] out
);

    wire [15:0] w1,w2;

    Mux4way16 mux4_1(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(s[1:0]),
        .out(w1)
    );

    Mux4way16 mux4_2(
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .s(s[1:0]),
        .out(w2)
    );

    Mux16 mux_1(
        .a(w1),
        .b(w2),
        .s(s[2]),
        .out(out)
    );

endmodule