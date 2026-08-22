module and16_tb;
    reg [15:0] a ;
    reg [15:0] b;
    wire [15:0] out;

    And16 and1(
        .a(a),
        .b(b),
        .out(out)
    );

    task check;
        input [15:0] exp;
        begin
        #10
        if(out == exp)
            $display("PASS: a = %b,b = %b, out= %b",a,b,out);
        else
           $display("FAIL: a = %b,b = %b, out= %b",a,b,out); 
        end
    endtask

    initial begin
        
        a = 16'b0100101101101011;
        b = 16'b0101011011011010;
        check(16'b0100001001001010); 

        a = 16'b0110101010100111;
        b = 16'b0100100010101001; 
        check(16'b1011001101010000);


        a = 16'b0101100001010100;
        b = 16'b0110001110101100;
        check(16'b1011110000000000);

    $finish;

    end
endmodule