module testbench();
    reg s;
    reg r;
    wire out;

    sr_latch unit_0(
        .s(s),
        .r(r),
        .out(out)
    );

    initial begin
        s = 1'b0; r = 1'b0; #10;
        s = 1'b0; r = 1'b1; #10;
        s = 1'b1; r = 1'b0; #10;
        s = 1'b1; r = 1'b1; #10;
        $stop;
    end
endmodule