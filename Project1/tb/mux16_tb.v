module Mux16_tb;
    reg [15:0] a;
    reg [15:0] b;
    reg s;
    wire [15:0] out;

    Mux16 mux1(
        .a(a),
        .b(b),
        .s(s),
        .out(out)
    );   

    task check;
        input [15:0] exp;
        begin
            #10
            if(out == exp)
                $display("PASS: a = %b,b = %b, s = %b,out = %b",a,b,s,out);
            else
                $display("PASS: a = %b,b = %b, s = %b,out = %b,(expected = %b)",a,b,s,out,exp);
        end
    endtask 

    initial begin
        a = 16'b0010010111000011;
        b = 16'b0110100111100100;
        s = 1;
        check(16'b0110100111100100);

        s=0;
        check(16'b0010010111000011);

        a = 16'b1100101010000010;
        b = 16'b0111101100010101;
        s = 0;
        check(16'b1100101010000010);

        s = 1;
        check(16'b0111101100010101);

       $finish; 
    end

endmodule