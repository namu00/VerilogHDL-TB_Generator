module testbench();
    reg [3:0] data;
    reg trig;

    wire odd_parity;
    wire even_parity;

    parity_gen odd(
        .data(data),
        .trig(data),
        .parity(odd_parity)
    );