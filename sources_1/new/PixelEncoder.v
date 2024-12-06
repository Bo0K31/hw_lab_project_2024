`timescale 1ns / 1ps

module PixelEncoder(
    x,
    y,
    rin,
    cin,
    charout,
    r,
    g,
    b,
    e
    );
    
    input wire [9:0] x;
    input wire [9:0] y;
    output reg [3:0] rin;
    output reg [5:0] cin;
    input wire [7:0] charout;
    output reg [3:0] r;
    output reg [3:0] g;
    output reg [3:0] b;
    input wire e;
    
    wire [16:0] x_div;
    wire [16:0] y_div;
    wire [16:0] xlocal; 
    wire [16:0] ylocal;
    wire [16:0] addr;
    
    assign x_div = x / 2;
    assign y_div = y / 2;
    assign xlocal = x_div % 16;
    assign ylocal = y_div % 32;
    assign addr = {{(9){1'b0}},charout} * 512 + ylocal * 16 + xlocal;
    
    (*rom_style = "block" *) reg [11:0] mem [0:66559];
    initial begin
        $readmemb("rom.mem", mem);
    end
    
    always @(x_div, y_div) begin
        rin = y_div / 32;
        cin = x_div / 16;
    end
    
    always @(xlocal, ylocal, addr) begin
        if(e) begin
            if(xlocal >= 0 && xlocal < 16 && ylocal >= 0 && ylocal < 32 && y_div / 32 < 7 && x_div / 16 < 20 && x_div >= 0 && x_div <= 320 && y_div >= 0 && y_div <= 240) begin
                {r,g,b} <= mem[addr];
            end
            else begin
                {r,g,b} <= 12'b000000001111;
            end
        end
    end
endmodule