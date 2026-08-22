module Mux16(
    input wire [15:0] a,
    input wire [15:0] b,
    input s,
    output wire [15:0] out
);
    Mux mux0(
        .a(a[0]),
        .b(b[0]),
        .s(s),
        .out(out[0])
    ); 

    Mux mux1(
        .a(a[1]),
        .b(b[1]),
        .s(s),
        .out(out[1])
    );

    Mux mux2(
        .a(a[2]),
        .b(b[2]),
        .s(s),
        .out(out[2])
    );

    Mux mux3(
        .a(a[3]),
        .b(b[3]),
        .s(s),
        .out(out[3])
    );


    Mux mux4(
        .a(a[4]),
        .b(b[4]),
        .s(s),
        .out(out[4])
    );

    Mux mux5(
        .a(a[5]),
        .b(b[5]),
        .s(s),
        .out(out[5])
    );

    Mux mux6(
        .a(a[6]),
        .b(b[6]),
        .s(s),
        .out(out[6])
    );


    Mux mux7(
        .a(a[7]),
        .b(b[7]),
        .s(s),
        .out(out[7])
    );

    Mux mux8(
        .a(a[8]),
        .b(b[8]),
        .s(s),
        .out(out[8])
    );

    Mux mux9(
        .a(a[9]),
        .b(b[9]),
        .s(s),
        .out(out[9])
    );

    Mux mux10(
        .a(a[10]),
        .b(b[10]),
        .s(s),
        .out(out[10])
    );

    Mux mux11(
        .a(a[11]),
        .b(b[11]),
        .s(s),
        .out(out[11])
    );

    Mux mux12(
        .a(a[12]),
        .b(b[12]),
        .s(s),
        .out(out[12])
    );

    Mux mux13(
        .a(a[13]),
        .b(b[13]),
        .s(s),
        .out(out[13])
    );

    Mux mux14(
        .a(a[14]),
        .b(b[14]),
        .s(s),
        .out(out[14])
    );

    Mux mux15(
        .a(a[15]),
        .b(b[15]),
        .s(s),
        .out(out[15])
    );

endmodule