`timescale 1ps/1ps
module testbench();
    reg [15:0] a,b;
    reg sel;
    wire [15:0] result;
    wire c_out;

    rcas_16bit test_unit(
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .c_out(c_out)
    );

    integer i,k;

    initial begin
        sel = 1'b0;
        for(i = 16'b0; i <= 16'hffff; i = i + 1'b1)begin
            a = i;
            for(k = 16'b0; k <= 16'hffff; k = k + 1'b1)begin
                b = k; #1;
                if(a + b != result)begin
                    $display("Failed Point(a + b): %d + %d, %d" , a, b, result);
                    $stop;
                end
            end
        end

        #10; sel = 1'b1;

        for(i = 16'b0; i <= 16'hffff; i = i + 1'b1)begin
            a = i;
            for(k = 16'b0; k <= 16'hffff; k = k + 1'b1)begin
                b = k; #1;
                if(a - b != result)begin
                    $display("Failed Point(a - b): %d - %d" , a, b);
                    $stop;
                end
            end
        end
        $display("\n\t############All Testcase Passed############\n");
        $stop;
    end
endmodule