`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 06:30:36
// Design Name: 
// Module Name: SystemTest
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


module SystemTest(

    );
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam PIXEL_BIT_LEN = 12; // this is fixed for {red,green,blue}
    
    localparam X_BIT_LEN = 10; // this is from vga
    localparam Y_BIT_LEN = 10; // this is from vga 
    
    reg [X_BIT_LEN - 1:0] x;
    reg [Y_BIT_LEN - 1:0] y;
    wire video_on;
    wire p_tick;
    wire [CHAR_ID_LENGTH - 1:0] show_chacracter_id;
    wire [ROW_BIT_LEN - 1:0] show_row;
    wire [COL_BIT_LEN - 1:0] show_col;
    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;
 
    CharacterPlane characerPlane(show_chacracter_id,show_row,show_col,0,0,0,0,0);
    PixelEncoder pixelEncoder(x,y,show_row,show_col,show_chacracter_id,red,green,blue,1);
    
     initial begin
        #1; x = 0; y = 0;
#1; x = 16; y = 0;
#1; x = 32; y = 0;
#1; x = 48; y = 0;
#1; x = 64; y = 0;
#1; x = 80; y = 0;
#1; x = 96; y = 0;
#1; x = 112; y = 0;
#1; x = 128; y = 0;
#1; x = 144; y = 0;
#1; x = 160; y = 0;
#1; x = 176; y = 0;
#1; x = 192; y = 0;
#1; x = 208; y = 0;
#1; x = 224; y = 0;
#1; x = 240; y = 0;
#1; x = 256; y = 0;
#1; x = 272; y = 0;
#1; x = 288; y = 0;
#1; x = 304; y = 0;
#1; x = 320; y = 0;
#1; x = 336; y = 0;
#1; x = 352; y = 0;
#1; x = 368; y = 0;
#1; x = 384; y = 0;
#1; x = 400; y = 0;
#1; x = 416; y = 0;
#1; x = 432; y = 0;
#1; x = 448; y = 0;
#1; x = 464; y = 0;
#1; x = 480; y = 0;
#1; x = 496; y = 0;
#1; x = 512; y = 0;
#1; x = 528; y = 0;
#1; x = 544; y = 0;
#1; x = 560; y = 0;
#1; x = 576; y = 0;
#1; x = 592; y = 0;
#1; x = 608; y = 0;
#1; x = 624; y = 0;
#1; x = 0; y = 32;
#1; x = 16; y = 32;
#1; x = 32; y = 32;
#1; x = 48; y = 32;
#1; x = 64; y = 32;
#1; x = 80; y = 32;
#1; x = 96; y = 32;
#1; x = 112; y = 32;
#1; x = 128; y = 32;
#1; x = 144; y = 32;
#1; x = 160; y = 32;
#1; x = 176; y = 32;
#1; x = 192; y = 32;
#1; x = 208; y = 32;
#1; x = 224; y = 32;
#1; x = 240; y = 32;
#1; x = 256; y = 32;
#1; x = 272; y = 32;
#1; x = 288; y = 32;
#1; x = 304; y = 32;
#1; x = 320; y = 32;
#1; x = 336; y = 32;
#1; x = 352; y = 32;
#1; x = 368; y = 32;
#1; x = 384; y = 32;
#1; x = 400; y = 32;
#1; x = 416; y = 32;
#1; x = 432; y = 32;
#1; x = 448; y = 32;
#1; x = 464; y = 32;
#1; x = 480; y = 32;
#1; x = 496; y = 32;
#1; x = 512; y = 32;
#1; x = 528; y = 32;
#1; x = 544; y = 32;
#1; x = 560; y = 32;
#1; x = 576; y = 32;
#1; x = 592; y = 32;
#1; x = 608; y = 32;
#1; x = 624; y = 32;
#1; x = 0; y = 64;
#1; x = 16; y = 64;
#1; x = 32; y = 64;
#1; x = 48; y = 64;
#1; x = 64; y = 64;
#1; x = 80; y = 64;
#1; x = 96; y = 64;
#1; x = 112; y = 64;
#1; x = 128; y = 64;
#1; x = 144; y = 64;
#1; x = 160; y = 64;
#1; x = 176; y = 64;
#1; x = 192; y = 64;
#1; x = 208; y = 64;
#1; x = 224; y = 64;
#1; x = 240; y = 64;
#1; x = 256; y = 64;
#1; x = 272; y = 64;
#1; x = 288; y = 64;
#1; x = 304; y = 64;
#1; x = 320; y = 64;
#1; x = 336; y = 64;
#1; x = 352; y = 64;
#1; x = 368; y = 64;
#1; x = 384; y = 64;
#1; x = 400; y = 64;
#1; x = 416; y = 64;
#1; x = 432; y = 64;
#1; x = 448; y = 64;
#1; x = 464; y = 64;
#1; x = 480; y = 64;
#1; x = 496; y = 64;
#1; x = 512; y = 64;
#1; x = 528; y = 64;
#1; x = 544; y = 64;
#1; x = 560; y = 64;
#1; x = 576; y = 64;
#1; x = 592; y = 64;
#1; x = 608; y = 64;
#1; x = 624; y = 64;
#1; x = 0; y = 96;
#1; x = 16; y = 96;
#1; x = 32; y = 96;
#1; x = 48; y = 96;
#1; x = 64; y = 96;
#1; x = 80; y = 96;
#1; x = 96; y = 96;
#1; x = 112; y = 96;
#1; x = 128; y = 96;
#1; x = 144; y = 96;
#1; x = 160; y = 96;
#1; x = 176; y = 96;
#1; x = 192; y = 96;
#1; x = 208; y = 96;
#1; x = 224; y = 96;
#1; x = 240; y = 96;
#1; x = 256; y = 96;
#1; x = 272; y = 96;
#1; x = 288; y = 96;
#1; x = 304; y = 96;
#1; x = 320; y = 96;
#1; x = 336; y = 96;
#1; x = 352; y = 96;
#1; x = 368; y = 96;
#1; x = 384; y = 96;
#1; x = 400; y = 96;
#1; x = 416; y = 96;
#1; x = 432; y = 96;
#1; x = 448; y = 96;
#1; x = 464; y = 96;
#1; x = 480; y = 96;
#1; x = 496; y = 96;
#1; x = 512; y = 96;
#1; x = 528; y = 96;
#1; x = 544; y = 96;
#1; x = 560; y = 96;
#1; x = 576; y = 96;
#1; x = 592; y = 96;
#1; x = 608; y = 96;
#1; x = 624; y = 96;
#1; x = 0; y = 128;
#1; x = 16; y = 128;
#1; x = 32; y = 128;
#1; x = 48; y = 128;
#1; x = 64; y = 128;
#1; x = 80; y = 128;
#1; x = 96; y = 128;
#1; x = 112; y = 128;
#1; x = 128; y = 128;
#1; x = 144; y = 128;
#1; x = 160; y = 128;
#1; x = 176; y = 128;
#1; x = 192; y = 128;
#1; x = 208; y = 128;
#1; x = 224; y = 128;
#1; x = 240; y = 128;
#1; x = 256; y = 128;
#1; x = 272; y = 128;
#1; x = 288; y = 128;
#1; x = 304; y = 128;
#1; x = 320; y = 128;
#1; x = 336; y = 128;
#1; x = 352; y = 128;
#1; x = 368; y = 128;
#1; x = 384; y = 128;
#1; x = 400; y = 128;
#1; x = 416; y = 128;
#1; x = 432; y = 128;
#1; x = 448; y = 128;
#1; x = 464; y = 128;
#1; x = 480; y = 128;
#1; x = 496; y = 128;
#1; x = 512; y = 128;
#1; x = 528; y = 128;
#1; x = 544; y = 128;
#1; x = 560; y = 128;
#1; x = 576; y = 128;
#1; x = 592; y = 128;
#1; x = 608; y = 128;
#1; x = 624; y = 128;
#1; x = 0; y = 160;
#1; x = 16; y = 160;
#1; x = 32; y = 160;
#1; x = 48; y = 160;
#1; x = 64; y = 160;
#1; x = 80; y = 160;
#1; x = 96; y = 160;
#1; x = 112; y = 160;
#1; x = 128; y = 160;
#1; x = 144; y = 160;
#1; x = 160; y = 160;
#1; x = 176; y = 160;
#1; x = 192; y = 160;
#1; x = 208; y = 160;
#1; x = 224; y = 160;
#1; x = 240; y = 160;
#1; x = 256; y = 160;
#1; x = 272; y = 160;
#1; x = 288; y = 160;
#1; x = 304; y = 160;
#1; x = 320; y = 160;
#1; x = 336; y = 160;
#1; x = 352; y = 160;
#1; x = 368; y = 160;
#1; x = 384; y = 160;
#1; x = 400; y = 160;
#1; x = 416; y = 160;
#1; x = 432; y = 160;
#1; x = 448; y = 160;
#1; x = 464; y = 160;
#1; x = 480; y = 160;
#1; x = 496; y = 160;
#1; x = 512; y = 160;
#1; x = 528; y = 160;
#1; x = 544; y = 160;
#1; x = 560; y = 160;
#1; x = 576; y = 160;
#1; x = 592; y = 160;
#1; x = 608; y = 160;
#1; x = 624; y = 160;
#1; x = 0; y = 192;
#1; x = 16; y = 192;
#1; x = 32; y = 192;
#1; x = 48; y = 192;
#1; x = 64; y = 192;
#1; x = 80; y = 192;
#1; x = 96; y = 192;
#1; x = 112; y = 192;
#1; x = 128; y = 192;
#1; x = 144; y = 192;
#1; x = 160; y = 192;
#1; x = 176; y = 192;
#1; x = 192; y = 192;
#1; x = 208; y = 192;
#1; x = 224; y = 192;
#1; x = 240; y = 192;
#1; x = 256; y = 192;
#1; x = 272; y = 192;
#1; x = 288; y = 192;
#1; x = 304; y = 192;
#1; x = 320; y = 192;
#1; x = 336; y = 192;
#1; x = 352; y = 192;
#1; x = 368; y = 192;
#1; x = 384; y = 192;
#1; x = 400; y = 192;
#1; x = 416; y = 192;
#1; x = 432; y = 192;
#1; x = 448; y = 192;
#1; x = 464; y = 192;
#1; x = 480; y = 192;
#1; x = 496; y = 192;
#1; x = 512; y = 192;
#1; x = 528; y = 192;
#1; x = 544; y = 192;
#1; x = 560; y = 192;
#1; x = 576; y = 192;
#1; x = 592; y = 192;
#1; x = 608; y = 192;
#1; x = 624; y = 192;
#1; x = 0; y = 224;
#1; x = 16; y = 224;
#1; x = 32; y = 224;
#1; x = 48; y = 224;
#1; x = 64; y = 224;
#1; x = 80; y = 224;
#1; x = 96; y = 224;
#1; x = 112; y = 224;
#1; x = 128; y = 224;
#1; x = 144; y = 224;
#1; x = 160; y = 224;
#1; x = 176; y = 224;
#1; x = 192; y = 224;
#1; x = 208; y = 224;
#1; x = 224; y = 224;
#1; x = 240; y = 224;
#1; x = 256; y = 224;
#1; x = 272; y = 224;
#1; x = 288; y = 224;
#1; x = 304; y = 224;
#1; x = 320; y = 224;
#1; x = 336; y = 224;
#1; x = 352; y = 224;
#1; x = 368; y = 224;
#1; x = 384; y = 224;
#1; x = 400; y = 224;
#1; x = 416; y = 224;
#1; x = 432; y = 224;
#1; x = 448; y = 224;
#1; x = 464; y = 224;
#1; x = 480; y = 224;
#1; x = 496; y = 224;
#1; x = 512; y = 224;
#1; x = 528; y = 224;
#1; x = 544; y = 224;
#1; x = 560; y = 224;
#1; x = 576; y = 224;
#1; x = 592; y = 224;
#1; x = 608; y = 224;
#1; x = 624; y = 224;
#1; x = 0; y = 256;
#1; x = 16; y = 256;
#1; x = 32; y = 256;
#1; x = 48; y = 256;
#1; x = 64; y = 256;
#1; x = 80; y = 256;
#1; x = 96; y = 256;
#1; x = 112; y = 256;
#1; x = 128; y = 256;
#1; x = 144; y = 256;
#1; x = 160; y = 256;
#1; x = 176; y = 256;
#1; x = 192; y = 256;
#1; x = 208; y = 256;
#1; x = 224; y = 256;
#1; x = 240; y = 256;
#1; x = 256; y = 256;
#1; x = 272; y = 256;
#1; x = 288; y = 256;
#1; x = 304; y = 256;
#1; x = 320; y = 256;
#1; x = 336; y = 256;
#1; x = 352; y = 256;
#1; x = 368; y = 256;
#1; x = 384; y = 256;
#1; x = 400; y = 256;
#1; x = 416; y = 256;
#1; x = 432; y = 256;
#1; x = 448; y = 256;
#1; x = 464; y = 256;
#1; x = 480; y = 256;
#1; x = 496; y = 256;
#1; x = 512; y = 256;
#1; x = 528; y = 256;
#1; x = 544; y = 256;
#1; x = 560; y = 256;
#1; x = 576; y = 256;
#1; x = 592; y = 256;
#1; x = 608; y = 256;
#1; x = 624; y = 256;
#1; x = 0; y = 288;
#1; x = 16; y = 288;
#1; x = 32; y = 288;
#1; x = 48; y = 288;
#1; x = 64; y = 288;
#1; x = 80; y = 288;
#1; x = 96; y = 288;
#1; x = 112; y = 288;
#1; x = 128; y = 288;
#1; x = 144; y = 288;
#1; x = 160; y = 288;
#1; x = 176; y = 288;
#1; x = 192; y = 288;
#1; x = 208; y = 288;
#1; x = 224; y = 288;
#1; x = 240; y = 288;
#1; x = 256; y = 288;
#1; x = 272; y = 288;
#1; x = 288; y = 288;
#1; x = 304; y = 288;
#1; x = 320; y = 288;
#1; x = 336; y = 288;
#1; x = 352; y = 288;
#1; x = 368; y = 288;
#1; x = 384; y = 288;
#1; x = 400; y = 288;
#1; x = 416; y = 288;
#1; x = 432; y = 288;
#1; x = 448; y = 288;
#1; x = 464; y = 288;
#1; x = 480; y = 288;
#1; x = 496; y = 288;
#1; x = 512; y = 288;
#1; x = 528; y = 288;
#1; x = 544; y = 288;
#1; x = 560; y = 288;
#1; x = 576; y = 288;
#1; x = 592; y = 288;
#1; x = 608; y = 288;
#1; x = 624; y = 288;
#1; x = 0; y = 320;
#1; x = 16; y = 320;
#1; x = 32; y = 320;
#1; x = 48; y = 320;
#1; x = 64; y = 320;
#1; x = 80; y = 320;
#1; x = 96; y = 320;
#1; x = 112; y = 320;
#1; x = 128; y = 320;
#1; x = 144; y = 320;
#1; x = 160; y = 320;
#1; x = 176; y = 320;
#1; x = 192; y = 320;
#1; x = 208; y = 320;
#1; x = 224; y = 320;
#1; x = 240; y = 320;
#1; x = 256; y = 320;
#1; x = 272; y = 320;
#1; x = 288; y = 320;
#1; x = 304; y = 320;
#1; x = 320; y = 320;
#1; x = 336; y = 320;
#1; x = 352; y = 320;
#1; x = 368; y = 320;
#1; x = 384; y = 320;
#1; x = 400; y = 320;
#1; x = 416; y = 320;
#1; x = 432; y = 320;
#1; x = 448; y = 320;
#1; x = 464; y = 320;
#1; x = 480; y = 320;
#1; x = 496; y = 320;
#1; x = 512; y = 320;
#1; x = 528; y = 320;
#1; x = 544; y = 320;
#1; x = 560; y = 320;
#1; x = 576; y = 320;
#1; x = 592; y = 320;
#1; x = 608; y = 320;
#1; x = 624; y = 320;
#1; x = 0; y = 352;
#1; x = 16; y = 352;
#1; x = 32; y = 352;
#1; x = 48; y = 352;
#1; x = 64; y = 352;
#1; x = 80; y = 352;
#1; x = 96; y = 352;
#1; x = 112; y = 352;
#1; x = 128; y = 352;
#1; x = 144; y = 352;
#1; x = 160; y = 352;
#1; x = 176; y = 352;
#1; x = 192; y = 352;
#1; x = 208; y = 352;
#1; x = 224; y = 352;
#1; x = 240; y = 352;
#1; x = 256; y = 352;
#1; x = 272; y = 352;
#1; x = 288; y = 352;
#1; x = 304; y = 352;
#1; x = 320; y = 352;
#1; x = 336; y = 352;
#1; x = 352; y = 352;
#1; x = 368; y = 352;
#1; x = 384; y = 352;
#1; x = 400; y = 352;
#1; x = 416; y = 352;
#1; x = 432; y = 352;
#1; x = 448; y = 352;
#1; x = 464; y = 352;
#1; x = 480; y = 352;
#1; x = 496; y = 352;
#1; x = 512; y = 352;
#1; x = 528; y = 352;
#1; x = 544; y = 352;
#1; x = 560; y = 352;
#1; x = 576; y = 352;
#1; x = 592; y = 352;
#1; x = 608; y = 352;
#1; x = 624; y = 352;
#1; x = 0; y = 384;
#1; x = 16; y = 384;
#1; x = 32; y = 384;
#1; x = 48; y = 384;
#1; x = 64; y = 384;
#1; x = 80; y = 384;
#1; x = 96; y = 384;
#1; x = 112; y = 384;
#1; x = 128; y = 384;
#1; x = 144; y = 384;
#1; x = 160; y = 384;
#1; x = 176; y = 384;
#1; x = 192; y = 384;
#1; x = 208; y = 384;
#1; x = 224; y = 384;
#1; x = 240; y = 384;
#1; x = 256; y = 384;
#1; x = 272; y = 384;
#1; x = 288; y = 384;
#1; x = 304; y = 384;
#1; x = 320; y = 384;
#1; x = 336; y = 384;
#1; x = 352; y = 384;
#1; x = 368; y = 384;
#1; x = 384; y = 384;
#1; x = 400; y = 384;
#1; x = 416; y = 384;
#1; x = 432; y = 384;
#1; x = 448; y = 384;
#1; x = 464; y = 384;
#1; x = 480; y = 384;
#1; x = 496; y = 384;
#1; x = 512; y = 384;
#1; x = 528; y = 384;
#1; x = 544; y = 384;
#1; x = 560; y = 384;
#1; x = 576; y = 384;
#1; x = 592; y = 384;
#1; x = 608; y = 384;
#1; x = 624; y = 384;
#1; x = 0; y = 416;
#1; x = 16; y = 416;
#1; x = 32; y = 416;
#1; x = 48; y = 416;
#1; x = 64; y = 416;
#1; x = 80; y = 416;
#1; x = 96; y = 416;
#1; x = 112; y = 416;
#1; x = 128; y = 416;
#1; x = 144; y = 416;
#1; x = 160; y = 416;
#1; x = 176; y = 416;
#1; x = 192; y = 416;
#1; x = 208; y = 416;
#1; x = 224; y = 416;
#1; x = 240; y = 416;
#1; x = 256; y = 416;
#1; x = 272; y = 416;
#1; x = 288; y = 416;
#1; x = 304; y = 416;
#1; x = 320; y = 416;
#1; x = 336; y = 416;
#1; x = 352; y = 416;
#1; x = 368; y = 416;
#1; x = 384; y = 416;
#1; x = 400; y = 416;
#1; x = 416; y = 416;
#1; x = 432; y = 416;
#1; x = 448; y = 416;
#1; x = 464; y = 416;
#1; x = 480; y = 416;
#1; x = 496; y = 416;
#1; x = 512; y = 416;
#1; x = 528; y = 416;
#1; x = 544; y = 416;
#1; x = 560; y = 416;
#1; x = 576; y = 416;
#1; x = 592; y = 416;
#1; x = 608; y = 416;
#1; x = 624; y = 416;
#1; x = 0; y = 448;
#1; x = 16; y = 448;
#1; x = 32; y = 448;
#1; x = 48; y = 448;
#1; x = 64; y = 448;
#1; x = 80; y = 448;
#1; x = 96; y = 448;
#1; x = 112; y = 448;
#1; x = 128; y = 448;
#1; x = 144; y = 448;
#1; x = 160; y = 448;
#1; x = 176; y = 448;
#1; x = 192; y = 448;
#1; x = 208; y = 448;
#1; x = 224; y = 448;
#1; x = 240; y = 448;
#1; x = 256; y = 448;
#1; x = 272; y = 448;
#1; x = 288; y = 448;
#1; x = 304; y = 448;
#1; x = 320; y = 448;
#1; x = 336; y = 448;
#1; x = 352; y = 448;
#1; x = 368; y = 448;
#1; x = 384; y = 448;
#1; x = 400; y = 448;
#1; x = 416; y = 448;
#1; x = 432; y = 448;
#1; x = 448; y = 448;
#1; x = 464; y = 448;
#1; x = 480; y = 448;
#1; x = 496; y = 448;
#1; x = 512; y = 448;
#1; x = 528; y = 448;
#1; x = 544; y = 448;
#1; x = 560; y = 448;
#1; x = 576; y = 448;
#1; x = 592; y = 448;
#1; x = 608; y = 448;
#1; x = 624; y = 448;

        #10; $finish;
    end
endmodule
