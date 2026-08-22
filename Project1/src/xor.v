module Xor(
    input a,
    input b,
    output out
);

wire w1,w2,w3,w4;

Not not1(
    .in(a),
    .out(w1)
);

Not not2(
    .in(b),
    .out(w2)
);

And and1(
    .a(w1),
    .b(b),
    .out(w3)
);

And and2(
    .a(a),
    .b(w2),
    .out(w4)
);

Or or1(
    .a(w3),
    .b(w4),
    .out(out)
);



endmodule