module Reg_tb;
    reg [15:0] in;
    reg ld;
    reg clk;
    wire [15:0] out;

    Reg dut(
        .in(in),
        .ld(ld),
        .clk(clk),
        .out(out)
    );

    always #5 clk = ~clk;

    task check;
        input [15:0] exp;
        begin
            if(out == exp)
                $display("PASS : in = %b, load = %b, out = %b",in,ld,out);
            else
                $display("FAIL : in = %b, load = %b, out = %b (expected = %b)",in,ld,out,exp);
        end
    endtask

    initial begin
        clk = 0;

        in = 16'b0011100100000000;
        ld =1'b1;
        #10
        check(16'b0011100100000000);

        in = 16'b0000110011001110;
        ld =1'b0;
        #10
        check(16'b0011100100000000);

        in = 16'b1000000000000000;
        ld = 1'b1;
        #10;
        check(16'b1000000000000000);

        in = 16'b0000000000000001;
        ld = 1'b1;
        #10;
        check(16'b0000000000000001);

        in = 16'b1000000000000000;
        ld = 1'b1;
        #10;
        check(16'b1000000000000000);

        in = 16'b1111111111111111;
        ld = 1'b1;
        #10;
        check(16'b1111111111111111);


        in = 16'b1010101010101010;
        ld = 1'b1;
        #10;
        check(16'b1010101010101010);

        ld = 1'b0;
        in = 16'b0101010101010101;
        #10;
        check(16'b1010101010101010);

        #10;
        check(16'b1010101010101010);

    

    $finish;
    end
endmodule 