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
    
    wire [16:0] scale_x;
    wire [16:0] scale_y;
    wire [16:0] shift_x;
    wire [16:0] shift_y;
    wire [16:0] x_on_character; 
    wire [16:0] y_on_character;
    wire [16:0] rom_address;
    
    assign scale_x = x / 2;
    assign scale_y = y / 2;
    assign shift_x = scale_x - 0;
    assign shift_y = scale_y - 0;
    assign x_on_character = shift_x % 16;
    assign y_on_character = shift_y % 32;
    assign rom_address = {{(17 - 8){1'b0}},charout} * 512 + 
        (y_on_character - 0) * 16 +
        (x_on_character - 0);
    
    (*rom_style = "block" *) reg [11:0] mem [0:66559];
    initial begin
        $readmemb("rom.mem", mem);
    end
    
    always @(shift_x, shift_y) begin
        rin = shift_y / 32;
        cin = shift_x / 16;    
    end
    
    always @(x_on_character, y_on_character, rom_address) begin
        if(e) begin
            if(x_on_character >= 0 && x_on_character < (0 + 16) &&
            y_on_character >= 0 && y_on_character < (0 + 32) &&
            shift_y / 32 < 7 && shift_x / 16 < 20 &&
            scale_x >= 0 && scale_x <= 640 / 2 - 0 &&
            scale_y >= 0 && scale_y <= 480 / 2 - 0) begin
                {r,g,b} <= mem[rom_address];
            end
            else begin
                {r,g,b} <= 12'b000000001111;
            end
        end
    end
endmodule