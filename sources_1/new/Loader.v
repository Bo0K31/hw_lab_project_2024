`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 12:10:32
// Design Name: 
// Module Name: Loader
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


    module Loader(
    out_data,
    out_address,
    load_enable,
    x_out,
    y_out,
    character_id,
    x,
    y,
    e,
    finish,
    clock
    );
    parameter CHAR_ID_WIDTH = 256;
    
    parameter DATA_WIDTH = 12;
    parameter ADDR_WIDTH = 8;
    
    parameter X_WIDTH = 5;
    parameter Y_WIDTH = 5;
    parameter CHAR_ADDR_SIZE = X_WIDTH + Y_WIDTH;
    parameter CHAR_SIZE = 1 << (CHAR_ADDR_SIZE);

    output reg [DATA_WIDTH-1:0] out_data;
    output reg [CHAR_ADDR_SIZE-1:0] out_address;
    output reg load_enable;
    output reg [X_WIDTH-1:0] x_out;
    output reg [Y_WIDTH-1:0] y_out;
    input wire [CHAR_ID_WIDTH-1:0] character_id;
    input wire [X_WIDTH-1:0]x;
    input wire [Y_WIDTH-1:0]y;
    input wire e;
    output reg finish;
    input wire clock;
    
    reg [DATA_WIDTH-1:0] data;
    reg [ADDR_WIDTH-1:0] address;
    reg [CHAR_ADDR_SIZE-1:0] counter;
    
    ROM rom(data,address);
    
    initial begin
        counter = 0;
        finish = 1;
    end
    
    always@(posedge clock) begin
        address <= (character_id * CHAR_SIZE) + counter;
        out_address <= counter;
        out_data <= data;
    end
    
    
    always@(finish) begin
        load_enable = 1 - finish; 
        if(load_enable == 1) begin
            x_out = x;
            y_out = y;    
        end
    end
    
    always@(posedge clock) begin
        if(e) begin
            finish = 0;
            counter = counter + 1;
            if(counter==CHAR_SIZE) begin
                counter = 0;
                finish = 1;
            end
        end
    end
endmodule
