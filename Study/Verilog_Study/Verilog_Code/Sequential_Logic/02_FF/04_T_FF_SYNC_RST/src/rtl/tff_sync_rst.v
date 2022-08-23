module tff_sync_rst(clk, rst, t, q);
    input clk;
    input rst;
    input t;
    output reg q;

    always @(posedge clk) begin
        if(!rst) q <= 1'b0;
        else if (t == 1'b1) q <= ~q;
    end
endmodule