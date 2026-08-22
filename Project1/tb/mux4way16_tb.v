`timescale 1ns/1ps

module Mux4way16_tb;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] c;
    reg [15:0] d;
    reg [1:0] s;
    wire [15:0] out;

    Mux4way16 dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(s),
        .out(out)
    );

    task check;
        input reg [15:0] exp;
        begin
        #10
            if(out == exp)
                $display("PASS: a=%b,b=%b,c=%b,d=%b,s=%b,out=%b",a,b,c,d,s,out);
            else
                $display("FAIL: a=%b,b=%b,c=%b,d=%b,s=%b,out=%b (expected = %b)",a,b,c,d,s,out,exp);
        end
    endtask

    initial begin
        
        a =16'b0011100100000000;
        b =16'b0000110011001110;
        c =16'b1000110011010000;
        d =16'b0111110101100010;

        s =2'b10;
        check(16'b1000110011010000);

        s=2'b00;
        check(16'b0011100100000000);

        s=2'b01;
        check(16'b0000110011001110);

        $finish;
    end

endmodule
