module parity_gen (data, trig, parity);
    input [3:0] data;
    input trig;
    output parity;

    //trig == 0 / odd_parity
    //trig == 1 / even_parity

    assign parity = (trig == 0) ? 
        (data[0] ^ data[1] ^ data[2] ^ data[3]) :
        ~(data[0] ^ data[1] ^ data[2] ^ data[3]);
endmodule 