module Dmux8way_tb;
    reg in;
    reg [2:0] s;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    wire h;

    Dmux8way dut(
        .in(in),
        .s(s),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h)
    );

    task check_a;
        input exp;
        begin
        #10
            if(a==exp)
                $display("PASS: in=%b,s=%b,a=%b",in,s,a);
            else
                $display("FAIL: in=%b,s=%b,a=%b,exp=%b",in,s,a,exp);
        end
    endtask

    task check_b;
        input exp;
        begin
        #10
            if(b==exp)
                $display("PASS: in=%b,s=%b,b=%b",in,s,b);
            else
                $display("FAIL: in=%b,s=%b,b=%b,exp=%b",in,s,b,exp);
        end
    endtask

    task check_c;
        input exp;
        begin
        #10
            if(c==exp)
                $display("PASS: in=%b,s=%b,c=%b",in,s,c);
            else
                $display("FAIL: in=%b,s=%b,c=%b,exp=%b",in,s,c,exp);
        end
    endtask

    task check_d;
        input exp;
        begin
        #10
            if(d==exp)
                $display("PASS: in=%b,s=%b,d=%b",in,s,d);
            else
                $display("FAIL: in=%b,s=%b,d=%b,exp=%b",in,s,d,exp);
        end
    endtask

    task check_e;
        input exp;
        begin
        #10
            if(e==exp)
                $display("PASS: in=%b,s=%b,e=%b",in,s,e);
            else
                $display("FAIL: in=%b,s=%b,e=%b,exp=%b",in,s,e,exp);
        end
    endtask

    task check_f;
        input exp;
        begin
        #10
            if(f==exp)
                $display("PASS: in=%b,s=%b,f=%b",in,s,f);
            else
                $display("FAIL: in=%b,s=%b,f=%b,exp=%b",in,s,f,exp);
        end
    endtask

    task check_g;
        input exp;
        begin
        #10
            if(g==exp)
                $display("PASS: in=%b,s=%b,g=%b",in,s,g);
            else
                $display("FAIL: in=%b,s=%b,g=%b,exp=%b",in,s,g,exp);
        end
    endtask

    task check_h;
        input exp;
        begin
        #10
            if(h==exp)
                $display("PASS: in=%b,s=%b,h=%b",in,s,h);
            else
                $display("FAIL: in=%b,s=%b,h=%b,exp=%b",in,s,h,exp);
        end
    endtask

    initial begin
        in = 1;

        s = 3'b000;
        check_a(1); check_b(0); check_c(0); check_d(0);
        check_e(0); check_f(0); check_g(0); check_h(0);

        s = 3'b001;
        check_a(0); check_b(1); check_c(0); check_d(0);
        check_e(0); check_f(0); check_g(0); check_h(0);

        s = 3'b010;
        check_a(0); check_b(0); check_c(1); check_d(0);
        check_e(0); check_f(0); check_g(0); check_h(0);

        s = 3'b011;
        check_a(0); check_b(0); check_c(0); check_d(1);
        check_e(0); check_f(0); check_g(0); check_h(0);

        s = 3'b100;
        check_a(0); check_b(0); check_c(0); check_d(0);
        check_e(1); check_f(0); check_g(0); check_h(0);

        s = 3'b101;
        check_a(0); check_b(0); check_c(0); check_d(0);
        check_e(0); check_f(1); check_g(0); check_h(0);

        s = 3'b110;
        check_a(0); check_b(0); check_c(0); check_d(0);
        check_e(0); check_f(0); check_g(1); check_h(0);

        s = 3'b111;
        check_a(0); check_b(0); check_c(0); check_d(0);
        check_e(0); check_f(0); check_g(0); check_h(1);
        
    end
endmodule