module testbench();
    reg j;
    reg k;
    wire out;

    jk_latch unit_0(
        .j(j),
        .k(k),
        .out(out)
    );

    initial begin
        j = 1'b0; k = 1'b0; #10;
        j = 1'b0; k = 1'b1; #10;
        j = 1'b1; k = 1'b0; #10;
        j = 1'b1; k = 1'b1; #10;
        $stop;
    end
endmodule