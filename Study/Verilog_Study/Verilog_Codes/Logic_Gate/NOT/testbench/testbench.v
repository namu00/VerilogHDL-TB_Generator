module testbench();
    reg in;
    wire out;

    not_gate n(.in(in), .out(out));

    initial begin
        in = 1'b0;
        #10; #10;
        in = 1'b1;
        #10; #10;
        $stop;
    end
endmodule
