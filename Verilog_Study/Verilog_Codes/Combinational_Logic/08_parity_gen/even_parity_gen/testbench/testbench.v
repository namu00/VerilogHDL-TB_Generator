module testbench();
    reg [3:0] data;
    wire parity;

    even_party unit_0(
        .data(data),
        .parity(parity)
    );

    integer i;
    initial begin
        for(i = 4'b0; i <= 4'b1111; i = i + 1'b1)begin
            data = i; #10;
        end
        $stop;
    end
endmodule