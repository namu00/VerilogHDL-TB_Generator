module siso (clk, rst, shift, in, out);
    input clk, rst, shift, in;
    output out;

    reg [3:0] d_ff;

    always @ (posedge clk, negedge rst) begin
        if(!rst) d_ff <= 4'b0;
        else begin
            if(shift) {d_ff[3:1], d_ff[0]} <= {d_ff[2:0], in};
            else d_ff <= d_ff;
        end
    end

    assign out = d_ff[3];
endmodule 