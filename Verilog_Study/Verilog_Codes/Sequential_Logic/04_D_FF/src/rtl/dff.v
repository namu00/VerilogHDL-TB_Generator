module dff(clk, rst, in,out);
    input in,clk,rst;
    output reg out;

    always @(posedge clk or negedge rst)begin
        if (!rst) out <= 0;
        else out <= in;
    end
endmodule