module mux (a,b,c,d,sel, out);
    input [3:0]a,b,c,d;
    input [1:0] sel;
    output reg [3:0]out;

    always @ (sel)
    begin
        if (sel == 2'b00) out = a;
        else if (sel == 2'b01) out = b;
        else if (sel == 2'b10) out = c;
        else if (sel == 2'b11) out = d;
        else out = 1'b00;
    end
endmodule