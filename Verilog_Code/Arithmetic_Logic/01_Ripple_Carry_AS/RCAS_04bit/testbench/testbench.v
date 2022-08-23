module testbench();
    reg [3:0] a,b;
    reg sel;
    wire [3:0] result;
    wire c_out;

    rcas_4bit test_unit(
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .c_out(c_out)
    );

    integer i,k;

    initial begin
        sel = 1'b0;
        for(i = 4'b0; i <= 4'hf; i = i + 1'b1)begin
            a = i;
            for(k = 4'b0; k <= 4'hf; k = k + 1'b1)begin
                b = k; #1;
                if(a + b != result)begin
                    $display("Failed Point(a + b): %d + %d" , a, b);
                    $stop;
                end
            end
        end

        #10; sel = 1'b1;

        for(i = 4'b0; i <= 4'hf; i = i + 1'b1)begin
            a = i;
            for(k = 4'b0; k <= 4'hf; k = k + 1'b1)begin
                b = k; #1;
                if(a - b != result)begin
                    $display("Failed Point(a - b): %d - %d" , a, b);
                    $stop;
                end
            end
        end
        $display("\t############All Testcase Passed############\n");
        $stop;
    end
endmodule