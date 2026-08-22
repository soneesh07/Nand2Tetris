`timescale 1ns/1ps

module Halfadder_tb;
    reg a;
    reg b;
    wire sum;
    wire carry;

    Halfadder ha1(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    task check;
    input exp_s,exp_c;
    begin
        #10
        if((sum == exp_s) & (carry==exp_c))
            $display("PASS: a = %b,b=%b,sum=%b,carry = %b ",a,b,sum,carry);
        else
            $display("FAIL : a = %b,b=%b,sum=%b(expected sum = %b),carry = %b(expected carry =%b) ",a,b,sum,exp_s,carry,exp_c);
    end
    endtask

    initial begin
        a=1;
        b=1;
        check(0,1);

        a=1;
        b=0;
        check(1,0);

        a=0;
        b=1;
        check(1,0);

        a=0;
        b=0;
        check(0,0);

    $finish;

    end

endmodule