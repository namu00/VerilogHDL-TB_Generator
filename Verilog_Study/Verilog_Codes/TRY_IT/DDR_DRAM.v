/*
Parameter Description
----------------------
 clk    = CLOCK
 enable = Chip Enable(Active High)
 rw     = Read/Write
 addr   = Address
 data   = Dataline for Write
 read   = Dataline for Read
 ----------------------
 Memory Specs
 ----------------------
    Double Date Rate
    Depth = 8bit
    Width = 8bit
 ----------------------
 */
module ddr_dram(clk, enable, rw, addr, data, read);
    input clk;
    input enable; //Active High
    input rw; 
        // rw == 0 Read
        // rw == 1 Write
    input [2:0]addr; 
    input [7:0]data;
    output [7:0] read;

    reg [7:0] mem[0:7];
    reg [2:0] read_addr;

    always @ (posedge clk, negedge clk) begin

        if(enable) begin //Enabled, Active High

            if(rw == 1'b1) begin //Write
                mem[addr] <= data;
            end

            else begin //Read
                read_addr <= addr;
            end
        end
    end

    assign read = mem[read_addr];

endmodule

/*

row
000    [7][6][5][4][3][2][1][0]
    
001    [7][6][5][4][3][2][1][0]
    
010    [7][6][5][4][3][2][1][0]
    
011    [7][6][5][4][3][2][1][0]
    
100    [7][6][5][4][3][2][1][0]
    
101    [7][6][5][4][3][2][1][0]
    
110    [7][6][5][4][3][2][1][0]
    
111    [7][6][5][4][3][2][1][0]
*/