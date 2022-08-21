module testbench();
    reg a, b, c;
    wire out;

    xor_gate unit_0(
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        a = 1'b0; b = 1'b0; c = 1'b0; #10;
        a = 1'b0; b = 1'b0; c = 1'b1; #10;
        a = 1'b0; b = 1'b1; c = 1'b0; #10;
        a = 1'b0; b = 1'b1; c = 1'b1; #10;
        a = 1'b1; b = 1'b0; c = 1'b0; #10;
        a = 1'b1; b = 1'b0; c = 1'b1; #10;
        a = 1'b1; b = 1'b1; c = 1'b0; #10;
        a = 1'b1; b = 1'b1; c = 1'b1; #10;
        $stop;
    end
endmodule