module Ram512_tb;
    reg [15:0] in;
    reg [8:0] address;
    reg ld;
    reg clk;
    wire[15:0] out;

    Ram512 dut(
        .in(in),
        .address(address),
        .ld(ld),
        .clk(clk),
        .out(out)
    );

    always #5 clk = ~clk;

    task check;
    input [15:0] exp;
    begin
        if(out == exp)
            $display("PASS : in = %b,load = %b, address = %b,out = %b",in,ld,address,out);
        else 
            $display("FAIL : in = %b,load = %b, address = %b,out = %b(expected = %b)",in,ld,address,out,exp);
    end
    endtask

    initial begin
    clk = 1'b0;

    in = 16'b0000000000000000;
    ld = 1'b0;
    address = 9'b000000000;
    #10;
    ld = 1'b1;
    #10;
    check(16'b0000000000000000);

    in = 16'b0011001101001011;
    ld = 1'b0;
    #10;
    check(16'b0000000000000000);

    ld = 1'b1;
    address = 9'b010000010;
    #10;
    check(16'b0011001101001011);

    ld = 1'b0;
    address = 9'b000000000;
    #10;
    check(16'b0000000000000000);

    in = 16'b0001001001111001;
    address = 9'b111011000;
    ld = 1'b1;
    #10;
    check(16'b0001001001111001);

    ld = 1'b0;
    #10;
    check(16'b0001001001111001);

    address = 9'b010000010;
    #2;
    check(16'b0011001101001011);

    in = 16'b0001001111111111;
    #10;
    check(16'b0011001101001011);

    ld = 1'b1;
    address = 9'b111111111;
    #10;
    check(16'b0001001111111111);

    ld = 1'b0;
    #10;
    check(16'b0001001111111111);

    address = 9'b111011000;
    #2;
    check(16'b0001001001111001);

    address = 9'b111111111;
    #2;
    check(16'b0001001111111111);

    ld = 1'b1;
    in = 16'b0101010101010101;

    address = 9'b010101000;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101001;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101010;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101011;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101100;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101101;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101110;
    #10;
    check(16'b0101010101010101);

    address = 9'b010101111;
    #10;
    check(16'b0101010101010101);

    ld = 1'b0;

    address = 9'b010101000;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101001;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101010;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101011;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101100;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101101;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101110;
    #2;
    check(16'b0101010101010101);

    address = 9'b010101111;
    #2;
    check(16'b0101010101010101);

    $finish;
end

endmodule