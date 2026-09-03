module Bit_tb;
    reg in;
    reg ld;
    reg clk;
    wire out;

    Bit dut(
        .in(in),
        .clk(clk),
        .ld(ld),
        .out(out)
    );

    always #5 clk = ~clk;

    task check;
    input exp;
    begin
        if(exp == out)
            $display("PASS : in = %b, load = %b, out =%b",in,ld,out);
        else
            $display("FAIL : in = %b, load = %b, out =%b(expected = %b)",in,ld,out,exp);
    end
    endtask

    initial begin
        clk = 0;

        in = 1'b0;
        ld = 1'b1;
        #10;
        check(0);

        in = 1'b1;
        ld = 1'b0;
        #10;
        check(0);

        in = 1'b1;
        ld = 1'b1;
        #10;
        check(1);

        in = 1'b0;
        ld = 1'b0;
        #10;
        check(1);

        in = 1'b1;
        ld = 1'b0;
        #10;
        check(1);

        in = 1'b0;
        ld = 1'b1;
        #10;
        check(0);

        in = 1'b1;
        ld = 1'b1;
        #10;
        check(1);

        in = 1'b0;
        ld = 1'b0;
        #10;
        check(1);

        in = 1'b1;
        ld = 1'b0;
        #10;
        check(1);

        in = 1'b0;
        ld = 1'b0;
        #10;
        check(1);

        $finish;
    end
endmodule