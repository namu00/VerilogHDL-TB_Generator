`timescale 1ns/1ps

module testbench();

    reg clk;
    reg rst_n;
    reg in;
    wire out;

    not_with_dff dut (
      .clk(clk),
      .rst_n(rst_n),
      .in(in),
      .out(out)
    );

    initial
    begin
      rst_n = 1'b1;
      #3 
      rst_n = 1'b0;
      @(negedge clk);
      rst_n = 1'b1;
    end

    initial
    begin
      clk <= 1'b0;
      forever begin
        //#0.7 clk <= ~clk;
        #5 clk <= ~clk;
      end
    end

    initial
    begin
        in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
    end

    initial
    begin
        $display("%t ns: %b - %b", $time, in, out);
        #10 $display("%t ns: %b - %b", $time, in, out);
        #10 $display("%t ns: %b - %b", $time, in, out);
        #10 $display("%t ns: %b - %b", $time, in, out);
	      #10;
        $stop;
    end

endmodule
