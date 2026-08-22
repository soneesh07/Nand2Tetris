module Mux(
    input a,
    input b,
    input s,
    output out
);

    wire w1,w2,w3;

    Not not1(
        .in(s),
        .out(w1)
    );

    And and1(
        .a(a),
        .b(w1),
        .out(w2)
    );

    And and2(
        .a(s),
        .b(b),
        .out(w3)
    );

    Or or1(
        .a(w2),
        .b(w3),
        .out(out)
    );

endmodule
