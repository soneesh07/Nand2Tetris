module Dmux4way_tb;
    reg in;
    reg [1:0] s;
    wire a;
    wire b;
    wire c;
    wire d;

    Dmux4way dut(
        .in(in),
        .s(s),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    task check_a;
        input exp;
        begin
        #10
            if(a ==exp)
                $display ("PASS : in = %b, s = %b,a=%b",in,s,a);
            else
                $display ("FAIL : in = %b, s = %b,a=%b,exp=%b ",in,s,a,exp);
        end
    endtask

    task check_b;
        input exp;
        begin
        #10
            if(b ==exp)
                $display ("PASS : in = %b, s = %b,b=%b",in,s,b);
            else
                $display ("FAIL : in = %b, s = %b,b=%b,exp=%b ",in,s,b,exp);
        end
    endtask

    task check_c;
        input exp;
        begin
        #10
            if(c ==exp)
                $display ("PASS : in = %b, s = %b,c=%b",in,s,c);
            else
                $display ("FAIL : in = %b, s = %b,c=%b,exp=%b ",in,s,c,exp);
        end
    endtask

    task check_d;
        input exp;
        begin
        #10
            if(d ==exp)
                $display ("PASS : in = %b, s = %b,d=%b",in,s,d);
            else
                $display ("FAIL : in = %b, s = %b,d=%b,exp=%b ",in,s,d,exp);
        end
    endtask

    initial begin
        in =1;

        s=2'b00;
        check_a(1);
        check_b(0);

        s = 2'b10;
        check_c(1);

        in = 0;
        s=2'b01;
        check_b(0);

        in = 1;
        s=2'b11;
        check_d(1);
        check_a(0);
    
    $finish;

    end

endmodule