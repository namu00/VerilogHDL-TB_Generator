module srff_sync_rst(clk, rst, s, r, q);
    input clk;
    input rst;
    input s;
    input r;
    output reg q;

    always @ (posedge clk) begin
        if (!rst) q <= 1'b0;
        else if (s == 1'b1 && r == 1'b0) q <= 1'b1;
        else if (s == 1'b0 && r == 1'b1) q <= 1'b0;
        else if (s == 1'b0 && r == 1'b0) q <= q;
        else q <= 1'bz;
    end
endmodule