module Fulladder(
    input a,
    input b,
    input c,
    output sum,
    output carry
);

    wire w1,w2,w3;
    Halfadder ha1(
        .a(a),
        .b(b),
        .sum(w1),
        .carry(w2)
    );

    Halfadder ha2(
        .a(w1),
        .b(c),
        .sum(sum),
        .carry(w3)
    );

    Or or1(
        .a(w2),
        .b(w3),
        .out(carry)
    );

endmodule