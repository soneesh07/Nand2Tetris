module PC(
    input [15:0] in,
    input ld,
    input inc,
    input rst,
    input clk,
    output [15:0] out
);

    wire [15:0] w1,w2,w3;

    assign w1= out;

    Inc16 inc1(
        .in(out),
        .out(w2)
    );

    Mux8way16 mux1(
        .a(w1),
        .b(w2),
        .c(in),
        .d(in),
        .e(16'b0),
        .f(16'b0),
        .g(16'b0),
        .h(16'b0),
        .s({rst,ld,inc}),
        .out(w3)
    );

    Reg reg1(
        .in(w3),
        .ld(1'b1),
        .clk(clk),
        .out(out)
    );

endmodule 