module dmux(in, sel, a,b,c,d);
    input [3:0]in;
    input [1:0] sel;

    output reg [3:0] a,b,c,d;

    always @ (sel or in)
    begin
        if (sel == 2'b00) begin 
             a = in;
             b = 4'bz;
             c = 4'bz;
             d = 4'bz;
        end

        else if (sel == 2'b01) begin 
             a = 4'bz;
             b = in;
             c = 4'bz;
             d = 4'bz;
        end

        else if (sel == 2'b10) begin 
             a = 4'bz;
             b = 4'bz;
             c = in;
             d = 4'bz;
        end

        else if (sel == 2'b11) begin 
             a = 4'bz;
             b = 4'bz;
             c = 4'bz;
             d = in;
        end

        else begin
            a = 4'bz;
            b = 4'bz;
            c = 4'bz;
            d = 4'bz;
        end
    end
endmodule