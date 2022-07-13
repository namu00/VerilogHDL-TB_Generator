module testbench ();
    reg a,b,c,d;
    wire [1:0] out;

    encoder unit_0(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        a = 0; b = 0; c = 0; d = 0; #10;
        a = 1; b = 0; c = 0; d = 0; #10;
        a = 0; b = 1; c = 0; d = 0; #10;
        a = 0; b = 0; c = 1; d = 0; #10;
        a = 0; b = 0; c = 0; d = 1; #10;
        $stop;
    end
endmodule