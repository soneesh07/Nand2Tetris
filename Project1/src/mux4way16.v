module Mux4way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [1:0] s,
    output wire [15:0] out
);

    wire [15:0] w1,w2;
    Mux16 mux1(
        .a(a),
        .b(b),
        .s(s[0]),
        .out(w1)
    );

    Mux16 mux2(
        .a(c),
        .b(d),
        .s(s[0]),
        .out(w2)
    );

    Mux16 mux3(
        .a(w1),
        .b(w2),
        .s(s[1]),
        .out(out)
    );

endmodule
