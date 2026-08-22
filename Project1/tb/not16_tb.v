`timescale 1ns/1ps

module Not16_tb;
    reg [15:0] in;
    wire [15:0] out;

    Not16 not1(
        .in(in),
        .out(out)
    );

    task check;
        input [15:0] exp;
        begin
        #10 
            if(out ==exp)
                $display("PASS: in =%b,out = %b",in,out);
            else
                $display("FAIL: in =%b,out = %b",in,out);
        end

    endtask

    initial begin

        in = 16'b0010010101101101;
        check(16'b1101101010010010);

        in = 16'b0101011011011010;
        check(16'b1010100100100101);

    $finish;
    end

endmodule 