`timescale 1ps/1ps
module testbench();
    reg [31:0] a,b;
    reg sel;
    wire [31:0] result;
    wire c_out;

    rcas_31bit test_unit(
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .c_out(c_out)
    );

    integer i,k;

    initial begin
        sel = 1'b0;
        for(i = 31'b0; i <= 31'hffff_ffff; i = i + 1'b1)begin
            a = i;
            for(k = 31'b0; k <= 31'hffff_ffff; k = k + 1'b1)begin
                b = k; #1;
                if(a + b != result)begin
                    $display("Failed Point(a + b): %d + %d, %d" , a, b, result);
                    $stop;
                end
            end
        end

        #10; sel = 1'b1;

        for(i = 31'b0; i <= 31'hffff; i = i + 1'b1)begin
            a = i;
            for(k = 31'b0; k <= 31'hffff; k = k + 1'b1)begin
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