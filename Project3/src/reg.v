module Reg (
    input [15:0] in,
    input ld,
    input clk,
    output [15:0] out
);


    genvar i;

    generate
        for(i = 0; i<16; i=i+1)
        begin : bit_gen
            Bit bit_inst(
                .in(in[i]),
                .ld(ld),
                .clk(clk),
                .out(out[i])
            );
        end
    endgenerate
    
endmodule