module Ram8_tb;
    reg [15:0] in;
    reg [2:0] address;
    reg ld;
    reg clk;
    wire [15:0] out;

    Ram8 dut(
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

        in = 16'b0011001100110011;
        ld = 1'b1;
        address = 3'b000;
        #10;
        check(16'b0011001100110011);

        in = 16'b1111000011110000;
        ld = 1'b0;
        address = 3'b000;
        #10;
        check(16'b0011001100110011);

        in = 16'b1010101010101010;
        ld = 1'b1;
        address = 3'b011;
        #10;
        check(16'b1010101010101010);

        ld = 1'b0;
        address = 3'b000;
        #2;
        check(16'b0011001100110011);

        address = 3'b011;
        #2;
        check(16'b1010101010101010);

        in = 16'b0101010101010101;
        ld = 1'b1;
        address = 3'b111;
        #10;
        check(16'b0101010101010101);

        ld = 1'b0;
        address = 3'b111;
        #2;
        check(16'b0101010101010101);

        address = 3'b000;
        #2;
        check(16'b0011001100110011);

        address = 3'b011;
        #2;
        check(16'b1010101010101010);

        // Write to all 8 addresses
        ld = 1'b1;

        in = 16'h0001;
        address = 3'b000;
        #10;
        check(16'h0001);

        in = 16'h0002;
        address = 3'b001;
        #10;
        check(16'h0002);

        in = 16'h0004;
        address = 3'b010;
        #10;
        check(16'h0004);

        in = 16'h0008;
        address = 3'b011;
        #10;
        check(16'h0008);

        in = 16'h0010;
        address = 3'b100;
        #10;
        check(16'h0010);

        in = 16'h0020;
        address = 3'b101;
        #10;
        check(16'h0020);

        in = 16'h0040;
        address = 3'b110;
        #10;
        check(16'h0040);

        in = 16'h0080;
        address = 3'b111;
        #10;
        check(16'h0080);

        // Read all 8 addresses
        ld = 1'b0;

        address = 3'b000;
        #2;
        check(16'h0001);

        address = 3'b001;
        #2;
        check(16'h0002);

        address = 3'b010;
        #2;
        check(16'h0004);

        address = 3'b011;
        #2;
        check(16'h0008);

        address = 3'b100;
        #2;
        check(16'h0010);

        address = 3'b101;
        #2;
        check(16'h0020);

        address = 3'b110;
        #2;
        check(16'h0040);

        address = 3'b111;
        #2;
        check(16'h0080);



        $finish;
    end
endmodule