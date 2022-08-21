module testbench();
    reg [3:0]a,b,c,d;
    reg [1:0] sel;
    wire [3:0]out;

    mux unit_0(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        a = 4'b0001;
        b = 4'b0010;
        c = 4'b0100;
        d = 4'b1000;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $stop;
    end
endmodule