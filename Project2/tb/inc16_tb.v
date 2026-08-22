module Inc16_tb;
    reg [15:0] in;
    wire [15:0] out;

    Inc16 inc16_1(
        .in(in),
        .out(out)
    );

    task check;
        input [15:0] exp;
        begin
        #10
            if(out==exp)
                $display("PASS: in = %b,out=%b",in,out);
            else 
                $display("FAIL: in = %b,out=%b(expected=%b)",in,out,exp);
        end
    endtask

    initial begin
        
        in=16'b1111111111111111;
        check(16'b0000000000000000);

        in=16'b0111111111111111;
        check(16'b1000000000000000);
    end
endmodule