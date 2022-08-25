module decoder(in, a,b,c,d);
    input [1:0] in;
    output reg a,b,c,d;

    always @(in)begin
        if (in == 2'b00)begin
            a = 1'b1;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
        end

        else if (in == 2'b01)begin
            a = 1'b0;
            b = 1'b1;
            c = 1'b0;
            d = 1'b0;
        end

        else if (in == 2'b10)begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b1;
            d = 1'b0;
        end

        else if (in == 2'b11)begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b1;
        end

        else begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
        end
    end
endmodule