module jkff_async_rst(j, k, clk, rst, q);
    input j;
    input k;
    input clk;
    input rst;
    output reg q;

    always @(posedge clk) begin
        if(!rst) q <= 1'b01;
        else if(j == 1'b1 && k == 1'b0) q <= 1'b1;
        else if(j == 1'b0 && k == 1'b1) q <= 1'b0;
        else if(j == 1'b1 && k == 1'b1) q <= ~q;
        else q <= q;
    end
endmodule