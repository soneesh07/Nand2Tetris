module Bit (
    input in,
    input clk,
    input ld,
    output out
);

    wire w1,w2;

    assign w2 = out;

    Mux mux1(
        .a(w2),
        .b(in),
        .s(ld),
        .out(w1)
    );

    DFF dff1(
        .in(w1),
        .clk(clk),
        .out(out)
    );

endmodule