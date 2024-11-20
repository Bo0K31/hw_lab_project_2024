`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 10:28:41
// Design Name: 
// Module Name: Stencil
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


module Stencil(
    out_data,
    out_address,
    in_data,
    in_address,
    draw_enable,
    finish,
    we,
    x,
    y,
    clock
    );
    
    parameter DATA_WIDTH = 12;
    parameter OUT_HWIDTH = 640;
    parameter OUT_VWIDTH = 480;
    parameter IN_HWIDTH = 50;
    parameter IN_VWIDTH = 50;
    
    parameter OUT_X_WIDTH = 10;
    parameter OUT_Y_WIDTH = 10;
    parameter OUT_ADDR_WIDTH = OUT_X_WIDTH + OUT_Y_WIDTH;
    
    parameter IN_X_WIDTH = 5;
    parameter IN_Y_WIDTH = 5;
    parameter IN_ADDR_WIDTH = IN_X_WIDTH + IN_Y_WIDTH;
    
    output reg [DATA_WIDTH-1:0]out_data;
    output reg [OUT_ADDR_WIDTH-1:0]out_address;
    input wire [DATA_WIDTH-1:0]in_data;
    output reg [IN_ADDR_WIDTH-1:0]in_address;
    output reg draw_enable;
    output reg finish;
    input wire we;
    input wire [IN_X_WIDTH-1:0]x;
    input wire [IN_Y_WIDTH-1:0]y;
    input wire clock;
    
    reg [IN_X_WIDTH-1:0]x_pointer;
    reg [IN_Y_WIDTH-1:0]y_pointer;
    
    StencilBuffer buffer(out_data,out_address,in_data,in_address,we,clock);
    
    initial begin
        x_pointer = 0;
        y_pointer = 0;
        finish = 1;
        draw_enable = 0;
    end

    always@(posedge clock) begin 
        in_address = (y_pointer) * IN_HWIDTH + x_pointer;
        out_address = (y_pointer + y) * OUT_HWIDTH + (x_pointer + x);
    end
    
    always@(negedge we) begin 
        finish = 0;
        draw_enable = 1;
    end
    
    always@(posedge clock) begin
        if (finish == 0) begin
            x_pointer = x_pointer + 1;
            if(x_pointer == IN_HWIDTH) begin
                x_pointer = 0;
                y_pointer = y_pointer + 1;
                if(y_pointer == IN_VWIDTH) begin
                    y_pointer = 0;
                    finish = 1;
                    draw_enable = 0;
                end
            end
        end
    end
    
endmodule
