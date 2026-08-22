module dmux_tb;
    reg in;
    reg s;
    wire a;
    wire b;

    Dmux dut(
        .in(in),
        .s(s),
        .a(a),
        .b(b)
    );

    task check_a;
        input exp;
        begin
        #10
        if(a==exp)
            $display("PASS: in = %b, sel = %b , a = %b, b =%b",in,s,a,b);
        else 
            $display("FAIL: in = %b, sel = %b , a = %b, b =%b",in,s,a,b);
        end
    endtask

    task check_b;
        input exp;
        begin
        #10
        if(b==exp)
            $display("PASS: in = %b, sel = %b , a = %b, b =%b",in,s,a,b);
        else 
            $display("FAIL: in = %b, sel = %b , a = %b, b =%b",in,s,a,b);
        end
    endtask

    initial begin

        in = 1;
        s = 0;
        check_a(1);
        check_b(0);

        s = 1;
        check_b(1);

        in = 0;
        s = 1;
        check_a(0);
        check_b(0);

    $finish;
    end

endmodule