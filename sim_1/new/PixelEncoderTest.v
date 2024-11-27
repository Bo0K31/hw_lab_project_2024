`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2024 09:22:49
// Design Name: 
// Module Name: PixelEncoderTest
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


module PixelEncoderTest(

    );
    
    reg [9:0] x;
    reg [9:0] y;
    wire [3:0] char_row;
    wire [4:0] char_column;
    wire [3:0] red,green,blue;
    
    PixelEncoder pixelEncoder(x,y,char_row,char_column,6,red,green,blue,1);
    
    initial begin
        #10; y = 1; x = 1;
        #10; y = 2; x = 2;    
        #10; y = 3; x = 3;    
        #10; y = 4; x = 4;    
        #10; y = 5; x = 5;    
        #10; y = 6; x = 6;    
        #10; y = 7; x = 7;    
        #10; y = 8; x = 8;    
        #10; y = 9; x = 9;    
        #10; y = 10; x = 10;    
        #10; y = 11; x = 11;    
        #10; y = 12; x = 12;    
        #10; y = 13; x = 13;    
        #10; y = 14; x = 14;    
        #10; y = 15; x = 15;    
        #10; y = 16; x = 16;    
        #10; y = 17; x = 17;    
        #10; y = 18; x = 18;    
        #10; y = 19; x = 19;    
        #10; y = 20; x = 20;    
        #10; y = 21; x = 21;    
        #10; y = 22; x = 22;    
        #10; y = 23; x = 23;
        #10; y = 24; x = 24;
        #10; y = 25; x = 25;
        #10; y = 26; x = 26;
        #10; y = 27; x = 27;
        #10; y = 28; x = 28;
        #10; y = 29; x = 29;
        #10; y = 30; x = 30;
        #10; y = 31; x = 31;
        #10; y = 32; x = 32;
        #10; y = 33; x = 33;
        #10; y = 34; x = 34;
        #10; y = 35; x = 35;
        #10; y = 36; x = 36;
        #10; y = 37; x = 37;
        #10; y = 38; x = 38;
        #10; y = 39; x = 39;
        #10; y = 40; x = 40;
        #10; y = 41; x = 41;
        #10; y = 42; x = 42;
        #10; y = 43; x = 43;
        #10; y = 44; x = 44;
        #10; $finish;
    end
    
endmodule
