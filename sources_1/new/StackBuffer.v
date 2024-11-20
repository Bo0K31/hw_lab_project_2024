`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 13:02:43
// Design Name: 
// Module Name: StackBuffer
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


module StackBuffer(
    push,
    character_id,
    x,
    y,
    pop,
    character_id_out,
    x_out,
    y_out,
    empty,
    clock
    );
    // this stack only hold 2^STACK_ADDR_WIDTH - 1
    parameter STACK_ADDR_WIDTH = 8;
    parameter STACK_MAX_SIZE = 1<<(STACK_ADDR_WIDTH) - 1;
    
    parameter CHAR_ID_WIDTH = 8;
    parameter X_WIDTH = 9;
    parameter Y_WIDTH = 9;
    
    input wire push;
    input wire [CHAR_ID_WIDTH-1:0]character_id;
    input wire [X_WIDTH-1:0]x;
    input wire [Y_WIDTH-1:0]y;
    input wire pop;
    output reg [CHAR_ID_WIDTH-1:0]character_id_out;
    output reg [X_WIDTH-1:0]x_out;
    output reg [X_WIDTH-1:0]y_out;
    output reg empty;
    input clock = 0;
    
    reg [STACK_ADDR_WIDTH-1:0] size;
    reg [CHAR_ID_WIDTH-1:0] out_data;
    reg [STACK_ADDR_WIDTH-1:0] out_address;
    reg [CHAR_ID_WIDTH-1:0] in_data;
    reg [STACK_ADDR_WIDTH-1:0] in_address;
    reg we;
    
    StackMem mem(out_data,out_address,in_data,in_address,we,clock);
    
    initial begin 
        we = 0;
        size = 0;
        empty = 1;
    end
    
    always@(posedge clock) begin
        if(push == 1) begin
            if(size != STACK_MAX_SIZE) begin
                in_address <= size;
                in_data <= {character_id,x,y};
                we = 1;
                size = size + 1;
            end
        end
        else begin
            we = 0;
        end
        if(pop == 1) begin
            if(size == 0) begin
                ;
            end
            else begin
                size = size - 1;
                out_address = size;
                {character_id_out,x_out,y_out} = out_data;
            end
        end 
    end
    
    always@(size) begin
        if(size == 0) begin
            empty = 1;
        end
        else begin
            empty = 0;
        end
    end
endmodule
