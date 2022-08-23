module encoder(a,b,c,d, out);
    input a,b,c,d;
    // a = 0 , out = 00
    // b = 1 , out = 01
    // c = 2 , out = 10
    // d = 3 , out = 11
    output reg [1:0] out;

    always @ (a or b or c or d) begin
        if (a == 1'b1) begin
            out = 2'b00;
        end

        else if (b == 1'b1) begin
            out = 2'b01;
        end

        else if (c == 1'b1) begin
            out = 2'b10;
        end

        else if (d == 1'b1) begin
            out = 2'b11;
        end

        else begin
            out = 2'b00;
        end
    end
endmodule