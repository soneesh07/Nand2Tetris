module Ram16k(
    input [15:0] in,
    input [13:0] address,
    input ld,
    input clk,
    output [15:0] out
);

    wire [3:0] w1;
    wire [15:0] w2 [3:0];

    Dmux4way dmux1(
        .in(ld),
        .s(address[13:12]),
        .a(w1[0]),
        .b(w1[1]),
        .c(w1[2]),
        .d(w1[3])
    );

    genvar i;

    generate
        for(i=0; i<4; i=i+1) begin: ram16k_gen
            Ram4k ram_reg(
                .in(in),
                .ld(w1[i]),
                .address(address[11:0]),
                .clk(clk),
                .out(w2[i])
            );
        end
    endgenerate

    Mux4way16 mux1(
        .a(w2[0]),
        .b(w2[1]),
        .c(w2[2]),
        .d(w2[3]),
        .s(address[13:12]),
        .out(out)
    );

endmodule