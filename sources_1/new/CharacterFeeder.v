`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:39:53
// Design Name: 
// Module Name: CharacterFeeder
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


module CharacterFeeder(
    row_out,
    col_out,
    character_id,
    push_up,
    reset_call,
    we,
    clock
    );
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    
    localparam TOTAL_CHAR_NUM = 100;
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    localparam CHAR_ID_LEN = 8;
    
    localparam COUNTER_LEN = ROW_BIT_LEN + COL_BIT_LEN;
    
    output reg [ROW_BIT_LEN - 1:0] row_out;
    output reg [COL_BIT_LEN - 1:0] col_out;
    input wire [CHAR_ID_LEN - 1:0] character_id;
    output reg push_up;
    output reg reset_call;
    input wire we;
    input wire clock;
    
    reg [COUNTER_LEN - 1:0] counter;
    
    initial begin
        counter = 0;
    end 
    
    always@(posedge clock) begin
        reset_call = 0;
        push_up = 0;
        if(we) begin
            if(character_id == 8'b11111111) begin
                reset_call = 1;
                counter = 0;
                row_out = 0;
                col_out = 0;
            end
            else begin
                row_out = counter / COL_NUMBER;
                col_out = counter % COL_NUMBER;
                counter = counter + 1;
                if(counter == TOTAL_CHAR_NUM) begin
                    counter = 0;
                    push_up = 1;
                end
            end
        end
    end
endmodule
