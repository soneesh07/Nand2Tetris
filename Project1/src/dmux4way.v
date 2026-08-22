module Dmux4way(
    input in,
    input wire [1:0] s,
    output a,
    output b,
    output c,
    output d
);
    wire w1,w2;
    Dmux dmux1(
        .in(in),
        .s(s[1]),
        .a(w1),
        .b(w2)
    );

    Dmux dmux2(
        .in(w1),
        .s(s[0]),
        .a(a),
        .b(b)
    );

    Dmux dmux3(
        .in(w2),
        .s(s[0]),
        .a(c),
        .b(d)
    );
    
endmodule