`timescale 1ns/1ps

module Mux8way16_tb;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] c;
    reg [15:0] d;
    reg [15:0] e;
    reg [15:0] f;
    reg [15:0] g;
    reg [15:0] h;
    reg [2:0] s;
    wire [15:0] out;

    Mux8way16 dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .s(s),
        .out(out)
    );

    task check;
        input reg [15:0] exp;
        begin
        #10
            if(out == exp)
                $display("PASS: a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b,h=%b,s=%b,out=%b",a,b,c,d,e,f,g,h,s,out);
            else
                $display("FAIL: a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b,h=%b,s=%b,out=%b(expected = %b)",a,b,c,d,e,f,g,h,s,out,exp);
        end
    endtask

    initial begin
        
        a=16'b1101000100111011;
        b=16'b0010111110000100;
        c=16'b0110000111101101;
        d=16'b1001110001010010;
        e=16'b1001110001010010;
        f=16'b0000101101110110;
        g=16'b0000101101110110;
        h=16'b0000101101110110;

        s =3'b110;
        check(16'b0000101101110110);

        s=3'b100;
        check(16'b1001110001010010);

        s=3'b010;
        check(16'b0110000111101101);

        s=3'b001;
        check(16'b0010111110000100);
    $finish;
    end
endmodule