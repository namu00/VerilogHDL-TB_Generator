module parity_checker(data, parity, trig, out);
    input [3:0] data;
    input trig;
    input parity;
    //trig == 0 / odd parity
    //trig == 1 / even parity
    output reg out;
    //out == 1 / Parity Error
    //out == 0 / Parity Passed

    always@(trig or data or parity) begin
        if (trig == 1'b0) begin
            out = (data[3] ^ data[2] ^ data[1] ^ data[0] ^ parity);
        end
        else if(trig == 1'b1) begin
            out  = ~(data[3] ^ data[2] ^ data[1] ^ data[0] ^ parity);
        end
        else begin
            out = 1'bz;
        end

    end
endmodule