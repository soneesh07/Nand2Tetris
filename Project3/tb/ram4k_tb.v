`timescale 1ns/1ps

module ram4k_tb;

    reg [15:0] in;
    reg load;
    reg [11:0] address;
    reg clk;

    wire [15:0] out;

    Ram4k dut (
        .in(in),
        .ld(load),
        .address(address),
        .clk(clk),
        .out(out)
    );

    always #5 clk = ~clk;

    task check;
        input [15:0] expected;
        begin
            if (out === expected)
                $display("PASS: in = %b, load = %b, address = %b, out = %b",
                         in, load, address, out);
            else
                $display("FAIL: in = %b, load = %b, address = %b, out = %b(expected = %b)",
                         in, load, address, out, expected);
        end
    endtask

    initial begin
        clk = 1'b0;
        in = 16'b0;
        load = 1'b0;
        address = 12'b0;

        #2;

        load = 1'b1;
        in = 16'b0000000000000000;
        address = 12'b000000000000;
        #11;
        check(16'b0000000000000000);

        load = 1'b1;
        in = 16'b0000000000001111;
        address = 12'b000011111111;
        #11;
        check(16'b0000000000001111);

        load = 1'b1;
        in = 16'b0000110110111001;
        address = 12'b110110110011;
        #11;
        check(16'b0000110110111001);

        load = 1'b1;
        in = 16'b0000111111111111;
        address = 12'b111111111111;
        #11;
        check(16'b0000111111111111);

        load = 1'b0;

        address = 12'b000000000000;
        #2;
        check(16'b0000000000000000);

        address = 12'b000011111111;
        #2;
        check(16'b0000000000001111);

        address = 12'b110110110011;
        #2;
        check(16'b0000110110111001);

        address = 12'b111111111111;
        #2;
        check(16'b0000111111111111);

        load = 1'b1;
        in = 16'b0101010101010101;

        address = 12'b101010101000;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101001;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101010;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101011;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101100;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101101;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101110;
        #11;
        check(16'b0101010101010101);

        address = 12'b101010101111;
        #11;
        check(16'b0101010101010101);

        load = 1'b0;

        address = 12'b101010101000;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101001;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101010;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101011;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101100;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101101;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101110;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101111;
        #2;
        check(16'b0101010101010101);

        load = 1'b1;
        in = 16'b1010101010101010;
        address = 12'b101010101000;
        #11;
        check(16'b1010101010101010);

        load = 1'b0;

        address = 12'b101010101000;
        #2;
        check(16'b1010101010101010);

        address = 12'b101010101001;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101010;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101011;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101100;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101101;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101110;
        #2;
        check(16'b0101010101010101);

        address = 12'b101010101111;
        #2;
        check(16'b0101010101010101);

        $finish;
    end

endmodule