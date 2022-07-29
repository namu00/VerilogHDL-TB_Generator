module dff(clk, rst, d, out);
    input clk;
    input rst;
    input d;
    output reg out;

    always @ (posedge clk, negedge rst)begin
        if(!rst) out <= 1'b0;
        else if (d == 1'b1) out <= 1'b1;
        else out <= 1'b0;
    end
endmodule

module jcnt(clk, rst, q);
    input clk;
    input rst;
    output [3:0] q;

    dff unit_3(
        .clk(clk),
        .rst(rst),
        .d(~q[0]),
        .out(q[3])
    );

    dff unit_2(
        .clk(clk),
        .rst(rst),
        .d(q[3]),
        .out(q[2])
    );
    
    dff unit_1(
        .clk(clk),
        .rst(rst),
        .d(q[2]),
        .out(q[1])
    );
    
    dff unit_0(
        .clk(clk),
        .rst(rst),
        .d(q[1]),
        .out(q[0])
    );
    
endmodule