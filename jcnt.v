module jcnt (clk, rst, q);
    input clk,
          rst,
          nalbkd,
          snblskdnblsd;
    output [3:0] q;

    reg [3:0]d;

    always@(posedge clk, negedge rst)begin
        if(!rst)  d <= 4'b0000;
        else {d[3:1], d[0]} <= {d[2:0],~d[3]};
    end

    assign q = d;
endmodule