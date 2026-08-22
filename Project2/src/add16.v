module Add16(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] sum,
    output carry
);

    wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14;
    Halfadder ha0(
        .a(a[0]),
        .b(b[0]),
        .sum(sum[0]),
        .carry(w0)
    );

    Fulladder fa1(
        .a(a[1]),
        .b(b[1]),
        .c(w0),
        .sum(sum[1]),
        .carry(w1)
    );

    Fulladder fa2(
        .a(a[2]),
        .b(b[2]),
        .c(w1),
        .sum(sum[2]),
        .carry(w2)
    );


    Fulladder fa3(
        .a(a[3]),
        .b(b[3]),
        .c(w2),
        .sum(sum[3]),
        .carry(w3)
    );


    Fulladder fa4(
        .a(a[4]),
        .b(b[4]),
        .c(w3),
        .sum(sum[4]),
        .carry(w4)
    );


    Fulladder fa5(
        .a(a[5]),
        .b(b[5]),
        .c(w4),
        .sum(sum[5]),
        .carry(w5)
    );


    Fulladder fa6(
        .a(a[6]),
        .b(b[6]),
        .c(w5),
        .sum(sum[6]),
        .carry(w6)
    );


    Fulladder fa7(
        .a(a[7]),
        .b(b[7]),
        .c(w6),
        .sum(sum[7]),
        .carry(w7)
    );


    Fulladder fa8(
        .a(a[8]),
        .b(b[8]),
        .c(w7),
        .sum(sum[8]),
        .carry(w8)
    );


    Fulladder fa9(
        .a(a[9]),
        .b(b[9]),
        .c(w8),
        .sum(sum[9]),
        .carry(w9)
    );


    Fulladder fa10(
        .a(a[10]),
        .b(b[10]),
        .c(w9),
        .sum(sum[10]),
        .carry(w10)
    );


    Fulladder fa11(
        .a(a[11]),
        .b(b[11]),
        .c(w10),
        .sum(sum[11]),
        .carry(w11)
    );


    Fulladder fa12(
        .a(a[12]),
        .b(b[12]),
        .c(w11),
        .sum(sum[12]),
        .carry(w12)
    );


    Fulladder fa13(
        .a(a[13]),
        .b(b[13]),
        .c(w12),
        .sum(sum[13]),
        .carry(w13)
    );


    Fulladder fa14(
        .a(a[14]),
        .b(b[14]),
        .c(w13),
        .sum(sum[14]),
        .carry(w14)
    );


    Fulladder fa15(
        .a(a[15]),
        .b(b[15]),
        .c(w14),
        .sum(sum[15]),
        .carry(carry)
    );

endmodule
