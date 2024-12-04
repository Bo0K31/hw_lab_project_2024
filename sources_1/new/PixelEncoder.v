`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 20:32:21
// Design Name: 
// Module Name: PixelEncoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PixelEncoder(
    x,
    y,
    char_row,
    char_col,
    character_id,
    red,
    green,
    blue,
    e
    );
    
    localparam CHAR_HEIGHT = 32; // height of the character
    localparam CHAR_WIDTH = 16; // width of the cahracter
    localparam CHAR_LEFT_PAD = 0; // space on the left side of the character
    localparam CHAR_RIGHT_PAD = 0; // space on the right side of the character
    localparam CHAR_TOP_PAD = 0; // space on the top side of the character
    localparam CHAR_BOTTOM_PAD = 0; // space at the bottom side of the character
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam PIXEL_BIT_LEN = 12; // this is fixed for {red,green,blue}
    
    localparam X_BIT_LEN = 10; // this is from vga
    localparam Y_BIT_LEN = 10; // this is from vga 
    
    localparam TOTAL_CHAR = 129; // total number of character in the rom
    
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    localparam ZOOM_FACTER = 1; // interger, zoom facter. the more the bigger the character.
    
    localparam TOTAL_CHAR_HEIGHT = CHAR_HEIGHT + CHAR_TOP_PAD + CHAR_BOTTOM_PAD;
    localparam TOTAL_CHAR_WIDTH = CHAR_WIDTH + CHAR_LEFT_PAD + CHAR_RIGHT_PAD;
    
    localparam CHAR_PIXELS = CHAR_HEIGHT * CHAR_WIDTH;
    
    localparam ROM_SIZE = TOTAL_CHAR * CHAR_PIXELS;
    localparam ROW_ADDR_BIT_LEN = 15; // set this number to cover ROW_SIZE(upper(log_2(ROW_SIZE)))
    
    input wire [X_BIT_LEN - 1:0] x;
    input wire [Y_BIT_LEN - 1:0] y;
    output reg [ROW_BIT_LEN - 1:0] char_row;
    output reg [COL_BIT_LEN - 1:0] char_col;
    input wire [CHAR_ID_LENGTH - 1:0] character_id;
    output reg [3:0] red;
    output reg [3:0] green;
    output reg [3:0] blue;
    input wire e;
    
    wire [ROW_ADDR_BIT_LEN - 1:0] scale_x;
    wire [ROW_ADDR_BIT_LEN - 1:0] scale_y;
    wire [ROW_ADDR_BIT_LEN - 1:0] x_on_character; // x position on the character
    wire [ROW_ADDR_BIT_LEN - 1:0] y_on_character; // y position on the character
    wire [ROW_ADDR_BIT_LEN - 1:0] rom_address;
    
    assign scale_x = x / ZOOM_FACTER;
    assign scale_y = y / ZOOM_FACTER;
    assign x_on_character = scale_x % TOTAL_CHAR_WIDTH;
    assign y_on_character = scale_y % TOTAL_CHAR_HEIGHT;
    assign rom_address = {{(ROW_ADDR_BIT_LEN - CHAR_ID_LENGTH){1'b0}},character_id} * CHAR_PIXELS + 
        (y_on_character - CHAR_TOP_PAD) * CHAR_WIDTH +
        (x_on_character - CHAR_LEFT_PAD);
    
    reg [PIXEL_BIT_LEN - 1:0] mem [ROM_SIZE - 1:0];
    
    always @(scale_x, scale_y) begin
        char_row = scale_y / TOTAL_CHAR_HEIGHT;
        char_col = scale_x / TOTAL_CHAR_WIDTH;    
    end
    
    always @(x_on_character, y_on_character, rom_address) begin
        if(e) begin
            if(x_on_character >= CHAR_LEFT_PAD && x_on_character < (CHAR_LEFT_PAD + CHAR_WIDTH) &&
            y_on_character >= CHAR_TOP_PAD && y_on_character < (CHAR_TOP_PAD + CHAR_HEIGHT) &&
            scale_y / TOTAL_CHAR_HEIGHT < ROW_NUMBER && scale_x / TOTAL_CHAR_WIDTH < COL_NUMBER) begin
                {red,green,blue} = mem[rom_address];
            end
            else begin
                {red,green,blue} = 12'b000000001111; // background
            end
        end
    end
endmodule
