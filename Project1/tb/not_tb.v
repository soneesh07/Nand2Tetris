`timescale 1ns/1ps

module not_tb;
    reg in;
    wire out;

Not not_1(
    .in(in),
    .out(out)
);

task check;
    input exp;
    begin
    #10
    if (out == exp)
        $display("PASS : in = %b and out = %b",in,out);
    else
        $display("FAIL : in = %b and out = %b",in,out);
end 
endtask

initial begin
    in = 1;
    check (0);

    in = 0;
    check(1);
    
$finish;

end
endmodule