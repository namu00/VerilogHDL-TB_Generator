module testbench();
    reg [3:0] in;
    reg [1:0] sel;

    wire [3:0] a,b,c,d;

    dmux unit_0(
        .in(in),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        in = 4'b1111;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $stop;
    end
endmodule