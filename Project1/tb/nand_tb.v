`timescale 1ns/1ps

module tb_Nand;

    reg a ;
    reg b;
    wire out;

    Nand dut (
        .a(a),
        .b(b),
        .out(out)
    );

task check;
    input exp;
    begin     
    #10;
    if (out == exp)
        $display("PASS: a=%b b=%b out=%b", a, b, out);
    else
        $display("FAIL: a=%b b=%b out=%b", a, b, out);
    end
endtask

initial begin

    $dumpfile("Project1/sim/nand.vcd");
    $dumpvars(0, tb_Nand);

    a = 0;
    b = 0;
    check(1);


    a = 0;
    b = 1;
    check(1);

    a = 1;
    b = 0;
    check(1);

    a = 1;
    b = 1;
    check(0);

    $finish;

    end 
endmodule



