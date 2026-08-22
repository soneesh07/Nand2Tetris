module or8way_tb;
    reg [7:0] a;
    wire out;

    Or8way dut(
        .a(a),
        .out(out)
    );

    task check;
        input exp;
        begin
        #10
            if(out == exp)
                $display("PASS: a=%b,out=%b",a,out);
            else
                $display("FAIL: a=%b,out%b(exp=%b)",a,out,exp);
        end
    endtask

    initial begin
        
        a = 8'b10110011;
        check(1);

        a = 8'b01001101;
        check(1);

        a = 8'b11100010;
        check(1);

        a = 8'b00000000;
        check(0);

        a = 8'b11111111;
        check(1);
        
        $finish;
    end
endmodule