module testbench();
    reg [3:0] a,b;
    reg c;
    wire [3:0] diff;
    wire borrow;

    rcs_4bit test_unit0(
        .a(a),
        .b(b),
        .borrow_in(c),
        .borrow(borrow),
        .diff(diff)
    );

    integer i,k;

    initial begin
        c = 1'b0;
        for(i = 4'b0; i <= 4'hf; i = i + 1'b1)begin
            a = i;
            for (k = 4'b0; k <= 4'hf; k = k + 1'b1)begin
                b = k; #10;
            end
        end
        $stop;
    end

endmodule