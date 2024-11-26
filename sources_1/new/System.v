`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 10:12:25
// Design Name: 
// Module Name: System
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


module System(
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue,
    output wire Hsync,
    output wire Vsync,
    input wire clk
    );
    
    localparam ROW_NUMBER = 16; // number of lines
    localparam COL_NUMBER = 32; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 5; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam PIXEL_BIT_LEN = 12; // this is fixed for {red,green,blue}
    
    wire x;
    wire y;
    wire video_on;
    wire p_tick;
    wire [CHAR_ID_LENGTH - 1:0] show_chacracter_id;
    wire [ROW_BIT_LEN - 1:0] show_row;
    wire [COL_BIT_LEN - 1:0] show_col;
    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;
    
    VGASync vga_sync(clk,0,Hsync,Vsync,video_on,p_tick,x,y);
    CharacterPlane characerPlane(show_chacracter_id,show_row,show_col,0,0,0,1,clk);
    PixelEncoder pixelEncoder(x,y,show_row,show_col,show_chacracter_id,red,green,blue,video_on);
    
    always@(x or y) begin
        if(video_on) begin
            vgaRed <= red;
            vgaGreen <= green;
            vgaBlue <= blue;
        end
    end
endmodule
