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
    output wire vgaRed[15:0],
    output wire vgaGreen[15:0],
    output wire vgaBlue[15:0],
    output wire Hsync,
    output wire Vsync,
    input wire clock
    );
    
    parameter VGA_X_WIDTH = 10;
    parameter VGA_Y_WIDTH = 10;
    parameter CHAR_X_WIDTH = 5;
    parameter CHAR_Y_WIDTH = 6;
    parameter CHAR_WIDTH = CHAR_Y_WIDTH + CHAR_X_WIDTH;
    
    wire reset = 0;
    wire video_on;
    wire p_tick;
    
    reg [VGA_X_WIDTH-1:0] x_vga_draw;
    reg [VGA_Y_WIDTH-1:0] y_reg_draw;
    reg [12:0]pixel;
    wire [12:0]stencil_data;
    wire [CHAR_WIDTH-1:0]stencil_address;
    wire [12:0]load_data;
    wire [CHAR_WIDTH-1:0]load_address;
    wire draw;
    wire load;
    wire draw_finish;
    wire load_finish;
    wire [VGA_X_WIDTH-1:0] x_stencil;
    wire [VGA_Y_WIDTH-1:0] y_stencil;
    wire stack_empty;
    wire pop;
    // put bit length later
    wire load_character_id;
    wire load_x;
    wire load_y;
    
    
    // put bit length later
    reg character_id;
    reg x;
    reg y;
    reg push;
    
    VGASync vga_sync(clock,reset,Hsync,Vsync,video_on,p_tick,x_vga_draw,y_vga_draw);
    Buffer screen_buffer(pixel,{y_vga_draw,x_vga_draw},stencil_data,stencil_address,draw,clock);
    Stencil stencil(stencil_data,stencil_address,load_data,load_address,draw,draw_finish,x_stencil,y_stencil,clock);
    Loader loader(stencil_data,stencil_address,draw,x_stencil,y_stencil,load_character_id,load_x,load_y,load,load_finish,clock);
    StackBuffer stack_buffer(push,character_id,x,y,pop,load_character_id,load_x,load_y,stack_empty,clock);
    Feeder feeder(pop,stack_empty,load,load_finish,draw_finish,clock);
    
endmodule
