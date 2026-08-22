`timescale 1ns/1ps

module Mux_tb;
    reg a;
    reg b;
    reg s;
    wire out;

    Mux mux1 (
        .a(a),
        .b(b),
        .s(s),
        .out(out)
    );

    task check;
        input exp;
        begin
        #10
        if(out == exp)
            $display("PASS : a= %b, b=%b,sel = %b,out = %b", a,b,s,out);
        else
            $display("FAIL : a= %b, b=%b,sel = %b,out = %b", a,b,s,out);

        end
    endtask

    initial 
    begin
            
        a = 1;
        b =0;

        s = 1;
        check(0);

        s = 0;
        check(1);

        a = 0;
        b = 1 ;

        s = 1 ;
        check(1);

        s = 0;
        check(0);

    $finish;

    end

endmodule
