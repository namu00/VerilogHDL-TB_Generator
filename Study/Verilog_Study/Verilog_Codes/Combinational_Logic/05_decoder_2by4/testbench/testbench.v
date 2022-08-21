module testbench();
    reg [1:0] in;
    wire a,b,c,d;

    decoder unit_0(
        .in(in),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;
        $stop;
    end
endmodule