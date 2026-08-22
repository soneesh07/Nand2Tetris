`timescale 1ns/1ps

module Xor_tb;

    reg a;
    reg b;
    wire out;

    Xor dut(
        .a(a),
        .b(b),
        .out(out)
    );

    task check;
        input exp;
        begin
        #10
        if(out==exp)
            $display("PASS : a = %b,b=%b,out=%b",a,b,out);
        else 
            $display("FAIL : a = %b,b=%b,out=%b",a,b,out);
        end
    endtask
    
    initial
    begin

        a =1;
        b=1;
        check(0);

        a=1;
        b=0;
        check(1);

        a=0;
        b=1;
        check(1);

        a=0;
        b=0;
        check(0);

    $finish;
    end
endmodule
