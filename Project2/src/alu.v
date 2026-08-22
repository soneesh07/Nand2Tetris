module Alu(
    input wire [15:0] a,
    input wire [15:0] b,
    input zx, nx, zy, ny, f, no,
    output wire [15:0] out,
    output zr,ng
);
    wire [15:0] x1, x2;
    wire [15:0] y1, y2;
    wire w1,w2;
    wire [15:0] w3,w4,w5,w6,w7,w8,w9,w10;
    wire zr_temp;


    Mux16 mux16_1(
        .a(a),
        .b(16'b0000000000000000),
        .s(zx),
        .out(x1)
    );

    Mux16 mux16_2(
        .a(b),
        .b(16'b0000000000000000),
        .s(zy),
        .out(y1)
    );

    Not16 not16_1(
        .in(x1),
        .out(w5)
    );

    Mux16 mux16_3(
        .a(x1),
        .b(w5),
        .s(nx),
        .out(x2)
    );

    Not16 not16_2(
        .in(y1),
        .out(w6)
    );

    Mux16 mux16_4(
        .a(y1),
        .b(w6),
        .s(ny),
        .out(y2)
    );

    Add16 add16_1(
        .a(x2),
        .b(y2),
        .sum(w7)
    );

    And16 and16_3(
        .a(x2),
        .b(y2),
        .out(w8)
    );

    Mux16 mux16_5(
        .a(w8),
        .b(w7),
        .s(f),
        .out(w9)
    );

    Not16 not16_3(
        .in(w9),
        .out(w10)
    );
    
    Mux16 mux16_6(
        .a(w9),
        .b(w10),
        .s(no),
        .out(out)
    );


    Or8way or8_1(
        .a(out[15:8]),
        .out(w1)
    );

    Or8way or8_2(
        .a(out[7:0]),
        .out(w2)
    );


    Or or_1(
        .a(w1),
        .b(w2),
        .out(zr_temp)
    );

    Not not_zr(
        .in(zr_temp),
        .out(zr)
    );

    assign ng = out[15];

endmodule