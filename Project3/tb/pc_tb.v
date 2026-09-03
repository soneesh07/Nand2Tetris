module Pc_tb;
    reg [15:0] in;
    reg rst;
    reg ld;
    reg clk;
    reg inc;
    wire [15:0] out;

    PC pc1(
        .in(in),
        .rst(rst),
        .ld(ld),
        .inc(inc),
        .clk(clk),
        .out(out)
    );

    always #5 clk = ~clk;

    task check;
    input [15:0] exp;
    begin
        if(out == exp)
            $display("PASS: in = %b, reset = %b, load = %b, inc =%b, out = %b",in,rst,ld,inc,out);
        else
            $display("FAIL: in = %b, reset = %b, load = %b, inc =%b, out = %b(exp = %b)",in,rst,ld,inc,out,exp);
    end
    endtask

    initial begin
    clk = 1'b0;

    // Initial reset
    in = 16'b0000000000000000;
    rst = 1'b1;
    ld = 1'b0;
    inc = 1'b0;
    #10;
    check(16'b0000000000000000);

    // Hold
    rst = 1'b0;
    #10;
    check(16'b0000000000000000);

    // Increment
    inc = 1'b1;
    #10;
    check(16'b0000000000000001);

    // Increment again
    in = 16'b1000001010000101;
    #10;
    check(16'b0000000000000010);

    // Load (load has priority over inc)
    ld = 1'b1;
    #10;
    check(16'b1000001010000101);

    // Increment
    ld = 1'b0;
    #10;
    check(16'b1000001010000110);

    // Increment again
    #10;
    check(16'b1000001010000111);

    // Load another value
    in = 16'b0011000000111001;
    ld = 1'b1;
    inc = 1'b0;
    #10;
    check(16'b0011000000111001);

    // Reset overrides load
    rst = 1'b1;
    #10;
    check(16'b0000000000000000);

    // Load overrides increment
    rst = 1'b0;
    ld = 1'b1;
    inc = 1'b1;
    #10;
    check(16'b0011000000111001);

    // Reset overrides both load and increment
    rst = 1'b1;
    #10;
    check(16'b0000000000000000);

    // Hold
    rst = 1'b0;
    ld = 1'b0;
    inc = 1'b0;
    #10;
    check(16'b0000000000000000);

    // Reset again
    rst = 1'b1;
    #10;
    check(16'b0000000000000000);

    // Load zero
    in = 16'b0000000000000000;
    rst = 1'b0;
    ld = 1'b1;
    inc = 1'b0;
    #10;
    check(16'b0000000000000000);

    // Increment from zero
    ld = 1'b0;
    inc = 1'b1;
    #10;
    check(16'b0000000000000001);

    // Reset overrides everything
    in = 16'b0101011011001110;
    rst = 1'b1;
    inc = 1'b0;
    #10;
    check(16'b0000000000000000);

    $finish;
end
endmodule