module Add16_tb;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum;
    wire carry;

    Add16 dut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    task check;
        input [15:0] exp_s;
        input exp_c;
        begin
        #10
            if((sum == exp_s)&&(carry == exp_c))
                $display("PASS: a = %b,b = %b,sum=%b,carry = %b",a,b,sum,carry);
            else
                $display("FAIL: a = %b,b = %b,sum=%b(expected = %b),carry = %b(expected = %b)",a,b,sum,exp_s,carry,exp_c);
        end
    endtask

    initial begin

        a = 16'b0000000000001111;
        b = 16'b0000000000000001;
        check(16'b0000000000010000,0);

        a = 16'b1111111111111111;
        b = 16'b1111111111111111;
        check(16'b1111111111111110,1);

        a = 16'b0111111111111111;
        b = 16'b0000000000000001;
        check(16'b1000000000000000,0);

        a = 16'b1000000000000000;
        b = 16'b1111111111111111;
        check(16'b0111111111111111,1);

        a = 16'b1010101010101010;
        b = 16'b0101010101010101;
        check(16'b1111111111111111,0);

        
        $finish;
    end

endmodule