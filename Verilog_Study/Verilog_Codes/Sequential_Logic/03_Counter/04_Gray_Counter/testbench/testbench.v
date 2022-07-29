module testbench();
    reg clk, rst, trig;
    wire [3:0]out;

    gcnt unit_0(
        .clk(clk),
        .rst(rst),
        .trig(trig),
        .count_out(out)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        trig = 1'b0; #160;
        trig = 1'b1; #160;
        $stop;
    end
endmodule

/*

===========GrayCode Table===========
Origin    |  Gray     |   Gray
 Data     |  Code     |   Code
(Binary)  |  (Binary) |   (Unsigned)
----------+-----------+-------------
0000      |  0000     |       0
0001      |  0001     |       1
0010      |  0011     |       3
0011      |  0010     |       2
0100      |  0110     |       6
0101      |  0111     |       7
0110      |  0101     |       5
0111      |  0100     |       4
1000      |  1100     |      12
1001      |  1101     |      13
1010      |  1111     |      15
1011      |  1110     |      14
1100      |  1010     |      10
1101      |  1011     |      11
1110      |  1001     |       9
1111      |  1000     |       8
====================================
*/