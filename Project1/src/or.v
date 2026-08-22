module Or(
    input a,
    input b,
    output out
);
    wire w1,w2;

    Not not1(
        .in(a),
        .out(w1)
    );

    Not not2(
        .in(b),
        .out(w2)
    );

    Nand nand1(
        .a(w1),
        .b(w2),
        .out(out)
    );

endmodule