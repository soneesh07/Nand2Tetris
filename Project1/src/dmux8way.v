module Dmux8way(
    input in,
    input [2:0] s,
    output a,
    output b, 
    output c,
    output d,
    output e,
    output f,
    output g,
    output h 
);

    wire w1,w2;

    Dmux dmux1(
        .in(in),
        .s(s[2]),
        .a(w1),
        .b(w2)
    );

    Dmux4way dmux4_1(
        .in(w1),
        .s(s[1:0]),
        .a(a),
        .b(b),
        .c(c),
        .d(d) 
    );

    Dmux4way dmux4_2(
        .in(w2),
        .s(s[1:0]),
        .a(e),
        .b(f),
        .c(g),
        .d(h) 
    );



endmodule