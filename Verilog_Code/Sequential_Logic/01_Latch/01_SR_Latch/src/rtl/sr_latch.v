module sr_latch(s,r,out);
    input s;
    input r;
    output reg out;

    assign out = 1'b0;
    //initialize 

    always@(s or r)begin
        if (s == 1'b1 && r == 1'b0 ) 
            out = 1'b1;
        else if (r == 1'b1 && s == 1'b0) 
            out = 1'b0;
        else if (r == 1'b0 && s == 1'b0)
            out = out;
        else 
            out = 1'bx; //forbidden
    end
endmodule