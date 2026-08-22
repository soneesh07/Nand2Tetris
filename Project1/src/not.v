module Not(
    input in,
    output out
);

Nand nand1(
    .a(in),
    .b(in),
    .out(out)
);

endmodule

