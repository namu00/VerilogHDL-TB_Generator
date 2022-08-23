module dff_sync_rst(clk, rst, d, q);
    input d;
    input clk;
    input rst;
    output reg q;

    always @ (posedge clk)begin
        if(!rst) q <= 0;
        else q <= d;
    end
endmodule