module testbench();
    reg d;
    wire out;

    d_latch unit_0(
        .d(d),
        .out(out)
    );

    initial begin
        d=1'b0; #10;
        d=1'b1; #10;
        d=1'b0; #10;
        d=1'b1; #10;
        $stop;
    end
endmodule