module siso (clk, rst, shift, in, out);
    input clk, rst, shift, in;
    output reg out;

    reg [3:0] d_ff;

    always @ (posedge clk, negedge rst) begin
        if(!rst) {out,d_ff} <= {1'b0,4'b0};
        else begin
            if(shift) {out, d_ff[3:1], d_ff[0]} <= {d_ff[3], d_ff[2:0], in};
            else {out, d_ff} <= {d_ff[3],d_ff};
        end
    end
endmodule 