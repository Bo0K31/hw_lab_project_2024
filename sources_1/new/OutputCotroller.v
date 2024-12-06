`timescale 1ns / 1ps

module OutputController(
    output reg [3:0] vgar,
    output reg [3:0] vgag,
    output reg [3:0] vgab,
    output wire Hsync,
    output wire Vsync,
    input wire [7:0] cin,
    input wire we,
    input wire clk
    );
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam PIXEL_BIT_LEN = 12; // this is fixed for {r,g,b}
    
    localparam X_BIT_LEN = 10; // this is from vga
    localparam Y_BIT_LEN = 10; // this is from vga 
    
    wire [X_BIT_LEN - 1:0] x;
    wire [Y_BIT_LEN - 1:0] y;
    wire video_on;
    wire p_tick;
    wire [CHAR_ID_LENGTH - 1:0] c_feedpane;
    wire [ROW_BIT_LEN - 1:0] r_feedpane;
    wire [COL_BIT_LEN - 1:0] c_feedpane;
    wire [CHAR_ID_LENGTH - 1:0] c_paneencoder;
    wire [ROW_BIT_LEN - 1:0] r_paneencoder;
    wire [COL_BIT_LEN - 1:0] c_paneencoder;
    wire s;
    wire reset;
    wire [3:0] r;
    wire [3:0] g;
    wire [3:0] b;
    
    VGASync vga_sync(clk,0,Hsync,Vsync,video_on,p_tick,x,y);
    CharacterPlane characerPlane(c_paneencoder,r_paneencoder,c_paneencoder,c_feedpane,r_feedpane,c_feedpane,we,reset,s,clk);
    PixelEncoder pixelEncoder(x,y,r_paneencoder,c_paneencoder,c_paneencoder,r,g,b,video_on);
    CharacterFeeder characterFeeder(c_feedpane,cin,r_feedpane,c_feedpane,s,reset,we,clk);
    
    always@(posedge clk) begin
        if (p_tick == 1) begin
            if(video_on) begin
                vgar <= r;
                vgag <= g;
                vgab <= b;
            end
            else begin
                vgar <= 0;
                vgag <= 0;
                vgab <= 0;
            end
        end
    end
endmodule
