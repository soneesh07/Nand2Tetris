module Ram64_tb;
    reg [15:0] in;
    reg [5:0] address;
    reg ld;
    reg clk;
    wire[15:0] out;

    Ram64 dut(
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
        clk = 0;
        ld = 1'b1;

    in = 16'b0101010101010101;

    address = 6'b101000;
    #10;
    check(16'b0101010101010101);

    address = 6'b101001;
    #10;
    check(16'b0101010101010101);

    address = 6'b101010;
    #10;
    check(16'b0101010101010101);

    address = 6'b101011;
    #10;
    check(16'b0101010101010101);

    address = 6'b101100;
    #10;
    check(16'b0101010101010101);

    address = 6'b101101;
    #10;
    check(16'b0101010101010101);

    address = 6'b101110;
    #10;
    check(16'b0101010101010101);

    address = 6'b101111;
    #10;
    check(16'b0101010101010101);


        
        $finish;
    end
endmodule