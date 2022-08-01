module testbench();
    reg [7:0] a, b;
    wire [7:0] diff;
    wire borrow;

    rcs_8bit test_unit0(
        .a(a),
        .b(b),
        .sum(diff),
        .carry(borrow)
    );

    integer i,k;

    initial begin
        for(i = 8'b0; i <= 8'hff; i = i + 1'b1)begin
            a = i;
            for (k = 8'b0; k <= 8'hff; k = k + 1'b1)begin
                b = k; #10;
            end
        end
        $stop;
    end

endmodule