module DFF_Tb;
    reg in;
    reg clk;
    wire out;

    DFF dff1(
        .in(in),
        .clk(clk),
        .out(out)
    );
    


    always #5 clk = ~clk;

    task check;
        input exp;
        begin

            if(exp == out)
                $display("PASS : in = %b, out = %b",in,out);
            else 
                $display("FAIL : in = %b, out = %b(expected = %b)",in,out,exp);
        end
    endtask

    initial begin
        clk = 0;

        in = 1'b1;
        #10 
        check(1); 


        in = 1'b0;
        #2
        check(1);

        #8
        check(0);

        #20
        check(0);

        #4
        in = 1'b1;
        #2
        check(1);


        $finish;
        end

endmodule