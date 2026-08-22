module Dmux (
    input in,
    input s,
    output a,
    output b
);

    wire w1;

    Not not1(
        .in(s),
        .out(w1)
    );

    And and1(
        .a(w1),
        .b(in),
        .out(a)
    );

    And and2(
        .a(s),
        .b(in),
        .out(b)
    );
    
endmodule