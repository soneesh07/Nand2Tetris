module Fulladder_tb;
    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry;

    Fulladder dut(
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

    task check;
    input exp_s,exp_c;
        begin
            #10

            if((sum==exp_s) && (carry == exp_c))
                $display("PASS: a = %b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
            else
                $display("FAIL: a = %b,b=%b,c=%b,sum=%b(expected = %b),carry=%b(expected = %b)",a,b,c,sum,exp_s,carry,exp_c);
        end
    endtask

    initial begin
        
        a = 1;
        b = 1;
        c = 1;
        check(1,1);

        a = 1;
        b = 1;
        c = 0;
        check(0,1);

        a = 1;
        b = 0;
        c = 1;
        check(0,1);

        a = 1;
        b = 0;
        c = 0;
        check(1,0);

        a = 0;
        b = 1;
        c = 1;
        check(0,1);

        a = 0;
        b = 1;
        c = 0;
        check(1,0);

        a = 0;
        b = 0;
        c = 1;
        check(1,0);

        a = 0;
        b = 0;
        c = 0;
        check(0,0);

        $finish;
    end

endmodule