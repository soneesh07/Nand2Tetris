module alu_tb;
    reg[15:0] a;
    reg [15:0] b;
    reg zx,nx,zy,ny,f,no;
    wire [15:0] out;
    wire zr,ng;

    Alu dut(
        .a(a),
        .b(b),
        .zx(zx),
        .nx(nx),
        .zy(zy),
        .ny(ny),
        .f(f),
        .no(no),
        .out(out),
        .zr(zr),
        .ng(ng)
    );

    task check;
        input [15:0] exp;
        input exp_z,exp_n;
        begin
        #10
            if((exp_n==ng) &&(exp_z==zr)&&(exp == out))
                $display("PASS: out = %b , ng=%b , zr=%b ",out,ng,zr);
            else 
                $display("FAIL: out = %b , ng=%b , zr=%b ",out,ng,zr);
        end
    endtask

    initial begin

    a = 16'd3;
    b = 16'd5;

    zx=1; nx=0; zy=1; ny=0; f=1; no=0;
    check(16'd0, 1, 0);

    zx=1; nx=1; zy=1; ny=1; f=1; no=1;
    check(16'd1, 0, 0);

    zx=1; nx=1; zy=1; ny=0; f=1; no=0;
    check(16'hFFFF, 0, 1);

    zx=0; nx=0; zy=1; ny=1; f=0; no=0;
    check(16'd3, 0, 0);

    zx=1; nx=1; zy=0; ny=0; f=0; no=0;
    check(16'd5, 0, 0);

    zx=0; nx=0; zy=1; ny=1; f=0; no=1;
    check(16'hFFFC, 0, 1);

    zx=1; nx=1; zy=0; ny=0; f=0; no=1;
    check(16'hFFFA, 0, 1);

    zx=0; nx=0; zy=1; ny=1; f=1; no=1;
    check(16'hFFFD, 0, 1);

    zx=1; nx=1; zy=0; ny=0; f=1; no=1;
    check(16'hFFFB, 0, 1);

    zx=0; nx=1; zy=1; ny=1; f=1; no=1;
    check(16'd4, 0, 0);

    zx=1; nx=1; zy=0; ny=1; f=1; no=1;
    check(16'd6, 0, 0);

    zx=0; nx=0; zy=1; ny=1; f=1; no=0;
    check(16'd2, 0, 0);

    zx=1; nx=1; zy=0; ny=0; f=1; no=0;
    check(16'd4, 0, 0);

    zx=0; nx=0; zy=0; ny=0; f=1; no=0;
    check(16'd8, 0, 0);

    zx=0; nx=1; zy=0; ny=0; f=1; no=1;
    check(16'hFFFE, 0, 1);

    zx=0; nx=0; zy=0; ny=1; f=1; no=1;
    check(16'd2, 0, 0);

    zx=0; nx=0; zy=0; ny=0; f=0; no=0;
    check(16'd1, 0, 0);

    zx=0; nx=1; zy=0; ny=1; f=0; no=1;
    check(16'd7, 0, 0);

    $finish;

end
endmodule
