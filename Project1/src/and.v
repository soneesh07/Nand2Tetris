module And(
    input a,
    input b,
    output out
);

wire out1;
Nand nand1(
    .a(a),
    .b(b),
    .out(out1)
);

Not not1(
    .in(out1),
    .out(out)
);

endmodule