`timescale 1ns / 1ps

module OutputController(
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue,
    output wire Hsync,
    output wire Vsync,
    input wire [7:0] cin,
    input wire we,
    input wire clk
    );
    
    wire [7:0] char_feedpane;
    wire [3:0] r_feedpane;
    wire [5:0] c_feedpane;
    wire [7:0] char_paneencoder;
    wire [3:0] r_paneencoder;
    wire [5:0] c_paneencoder;
    wire [3:0] r;
    wire [3:0] g;
    wire [3:0] b;
    wire video_on;
    wire p_tick;
    wire s;
    wire reset;
    wire [9:0] x;
    wire [9:0] y;
    
    VGASync vga_sync(clk,0,Hsync,Vsync,video_on,p_tick,x,y);
    CharacterPlane characerPlane(c_paneencoder,r_paneencoder,char_feedpane,c_feedpane,r_feedpane,we,reset,s,clk,char_paneencoder);
    PixelEncoder pixelEncoder(x,y,char_paneencoder,video_on,r_paneencoder,c_paneencoder,r,g,b);
    CharacterFeeder characterFeeder(cin,we,clk,char_feedpane,c_feedpane,r_feedpane,s,reset);
    
    always@(posedge clk) begin
        if (p_tick == 1) begin
            if(video_on) begin
                vgaRed <= r;
                vgaGreen <= g;
                vgaBlue <= b;
            end
            else begin
                vgaRed <= 0;
                vgaGreen <= 0;
                vgaBlue <= 0;
            end
        end
    end
endmodule
