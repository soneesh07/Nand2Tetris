module Ram4k(
    input [15:0] in,
    input [11:0] address,
    input ld,
    input clk,
    output [15:0] out
);

    wire [7:0]w1;
    wire [15:0] w2 [7:0];

    Dmux8way dmux1(
        .in(ld),
        .s(address[11:9]),
        .a(w1[0]),
        .b(w1[1]),
        .c(w1[2]),
        .d(w1[3]),
        .e(w1[4]),
        .f(w1[5]),
        .g(w1[6]),
        .h(w1[7])  
    );

    genvar i;

    generate
        for(i=0;i<8;i=i+1) begin: ram4k_gen
        Ram512 ram_reg(
            .in(in),
            .ld(w1[i]),
            .address(address[8:0]),
            .clk(clk),
            .out(w2[i])
        );
        end
    endgenerate

    Mux8way16 mux1(
        .a(w2[0]),
        .b(w2[1]),
        .c(w2[2]),
        .d(w2[3]),
        .e(w2[4]),
        .f(w2[5]),
        .g(w2[6]),
        .h(w2[7]),
        .s(address[11:9]),
        .out(out)
    );
    
endmodule
