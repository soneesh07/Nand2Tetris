module or16_tb;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] out;

    Or16 or1(
        .a(a),
        .b(b),
        .out(out)
    );

    task check;
        input [15:0] exp;
        begin
        #10
        if(out == exp)
            $display("PASS: a = %b, b = %b, out = %b", a, b, out);
        else
            $display("FAIL: a = %b, b = %b, out = %b (Expected: %b)", a, b, out, exp); 
        end
    endtask

    initial begin
        

        a = 16'b0100101101101011;
        b = 16'b0101011011011010;
        check(16'b0101111111111011); 

        a = 16'b0110101010100111;
        b = 16'b0100100010101001; 
        check(16'b0110101010101111);

        a = 16'b0101100001010100;
        b = 16'b0110001110101100;
        check(16'b0111101111111100);

        $finish;

    end
endmodule
