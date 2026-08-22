module Halfadder(
    input a,
    input b,
    output sum,
    output carry
);

    Xor xor1(
        .a(a),
        .b(b),
        .out(sum)
    );

    And and1(
        .a(a),
        .b(b),
        .out(carry)
    );

endmodule