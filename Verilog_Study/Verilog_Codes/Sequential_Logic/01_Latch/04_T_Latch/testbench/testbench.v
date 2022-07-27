module testbench();
    reg t;
    wire out;

    t_latch unit_0(
        .t(t),
        .out(out)
    );

    initial begin
        t = 1'b0; #10;
        t = 1'b1; #10;
        t = 1'b1; #10;
        t = 1'b0; #10;
        $stop;
    end

endmodule