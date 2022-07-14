module parity_gen (data, trig, parity);
    input [3:0] data;
    input trig;
    output reg parity;

    //trig == 0 / odd_parity
    //trig == 1 / even_parity

    always @ (trig or data)begin
        if (trig == 1'b0) begin
            parity = ~(data[3] ^ data[2] ^ data[1] ^ data[0]);
        end
        else if(trig == 1'b1) begin
            parity  = (data[3] ^ data[2] ^ data[1] ^ data[0]);
        end
        else begin
            parity = 1'bz;
        end
    end
endmodule 